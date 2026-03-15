# Software Architecture

This document describes the internal software architecture of the **OpenStack Image Factory Automation System**.

While the high-level architecture explains the infrastructure components, this document focuses on the **automation pipeline and software workflow** used to create production-ready operating system images.

---

# Architectural Overview

The system implements an automated **image build pipeline** that transforms upstream cloud images into validated and updated **golden images** for OpenStack.

The pipeline uses:

- Packer for orchestration
- OpenStack APIs for instance lifecycle
- Shell provisioning scripts for system preparation
- Glance for image publication
- Ceph RBD as the storage backend

The pipeline is designed to be **fully automated and repeatable**, ensuring consistent image generation.

---

# Core Software Components

The software architecture consists of several logical components.

## 1. Image Source

The pipeline begins with an **upstream cloud image**.

Example sources:

- Ubuntu Cloud Images
- Debian Cloud Images
- Rocky Linux Cloud Images
- AlmaLinux Cloud Images

These images are imported into OpenStack Glance as **base images**.

Example:

```

ubuntu-24.04-base

```

This base image acts as the starting point for the image build process.

---

# 2. Image Build Orchestrator

The central automation component is **Packer**.

Packer controls the image creation workflow by interacting with OpenStack services.

Responsibilities:

- launching temporary builder instances
- executing provisioning scripts
- managing SSH connections
- creating snapshots
- publishing final images

The build configuration is defined in a Packer template.

Example template:

```

packer/ubuntu-24.04.pkr.hcl

```

---

# 3. Builder Instance Lifecycle

Each image build uses a temporary **builder VM**.

Lifecycle stages:

```

Create Builder VM
        │
        ▼
Provision OS
        │
        ▼
Cleanup System
        │
        ▼
Shutdown Instance
        │
        ▼
Create Image Snapshot
        │
        ▼
Terminate Builder VM

```

The builder instance exists only during the build process.

---

# 4. Provisioning Layer

Provisioning scripts are responsible for preparing the operating system.

Provisioning tasks include:

- package index update
- system upgrades
- installation of required packages
- enabling system services
- installing cloud utilities

Example provisioning script:

```
scripts/provision-ubuntu.sh
```

Typical operations performed:

```

apt update
apt dist-upgrade
install qemu-guest-agent
install cloud utilities
enable ssh service

```

This stage transforms the base cloud image into a **production-ready system image**.

---

# 5. Cleanup Layer

After provisioning, the system performs cleanup tasks to ensure a clean image state.

Cleanup tasks include:

- removing temporary files
- clearing logs
- resetting machine-id
- cleaning cloud-init cache
- removing provisioning artifacts

Example cleanup script:

```

scripts/cleanup-ubuntu.sh

```

Typical cleanup operations:

```

cloud-init clean
truncate logs
reset machine-id
remove temporary directories

```

This step ensures that instances created from the image start with a clean system identity.

---

# 6. Image Publication

After provisioning and cleanup are complete:

1. the builder VM is stopped
2. OpenStack snapshots the instance
3. the snapshot is registered as a new Glance image

The new image includes metadata describing the build.

Example metadata:

```

os_distro=ubuntu
os_version=24.04
build_method=packer
purpose=golden-image

```

Images are tagged for easy identification.

Example tags:

```

ubuntu
24.04
golden
automated

```

---

# 7. Image Versioning Strategy

Images are versioned using build timestamps.

Example:

```

ubuntu-24.04-2026-03-10-1724

```

Advantages:

- easy identification of build date
- clear version history
- ability to maintain previous builds

Future improvements may include alias tags such as:

```

ubuntu-24.04-current

```

---

# 8. Storage Integration

All images are stored in the **Ceph RBD images pool**.

Example:

```

images pool

```

The image created by the pipeline becomes an RBD object in this pool.

Example mapping:

```

Glance Image ID
│
▼
Ceph RBD Object

```

When a VM is launched, Cinder may create a volume in the **volume pool** derived from the image.

---

# 9. Automation Flow

The complete software workflow is illustrated below.

```

Base Image in Glance
│
▼
Packer Build Trigger
│
▼
Launch Builder Instance
│
▼
Provision System
│
▼
System Cleanup
│
▼
Shutdown Builder Instance
│
▼
Snapshot to Glance
│
▼
Publish Golden Image
│
▼
Store Image in Ceph
│
▼
User VM Deployment

```

---

# 10. Failure Handling

The pipeline includes built-in failure handling mechanisms.

Examples:

If provisioning fails:

- the builder VM is terminated
- no image is created

If SSH fails:

- Packer aborts the build
- temporary resources are cleaned up

This ensures the system does not produce invalid images.

---

# 11. Security Considerations

Several practices ensure safe image generation.

Key practices include:

- removal of temporary credentials
- cleaning cloud-init state
- resetting machine identifiers
- clearing logs

These steps prevent security issues when multiple VMs are created from the same image.

---

# 12. Extensibility

The architecture is designed to support additional operating systems.

New OS support requires:

- a new base image
- a corresponding Packer template
- provisioning scripts specific to that OS

Example future templates:

```

packer/ubuntu-22.04.pkr.hcl
packer/debian-12.pkr.hcl
packer/rocky-9.pkr.hcl

```

---

# Summary

The software architecture implements a fully automated **image factory pipeline** using Packer and OpenStack APIs.

Key properties of the system include:

- repeatable image builds
- automated provisioning
- clean system images
- versioned image releases
- Ceph-backed storage integration

This architecture provides a scalable and maintainable approach to operating system image management in OpenStack environments.
