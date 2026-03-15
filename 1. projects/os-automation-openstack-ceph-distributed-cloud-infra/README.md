# OS Automation Image Factory for OpenStack + Ceph

A pipeline-driven **OpenStack Image Factory** that automatically builds, updates, and publishes production-ready cloud images for virtual machine deployment.

The system uses **Packer**, **OpenStack**, and **Ceph RBD** to create automated golden images that are continuously updated and ready for immediate VM provisioning.

---

# Project Motivation

In many OpenStack environments, operating system images are managed manually by administrators.

Typical workflow:

1. Download upstream cloud image
2. Upload it to Glance
3. Boot a VM
4. Apply updates and security patches
5. Recreate the image
6. Repeat for multiple operating systems

This process is:

- manual
- time consuming
- error prone
- difficult to scale

At the same time, users expect modern cloud platforms to provide **fresh and secure OS images**, similar to public clouds such as AWS.

This project aims to solve that gap by building an **automated image pipeline** for OpenStack.

---

# Project Goal

Design and implement an **automated OpenStack image factory** that:

- retrieves upstream cloud images
- builds temporary instances for image preparation
- updates and configures the operating system
- performs cleanup and preparation
- publishes versioned images to Glance
- stores images efficiently using Ceph RBD
- enables users to launch up-to-date virtual machines without manual image maintenance

---

# Key Technologies

| Technology | Purpose |
|------------|--------|
| **OpenStack (DevStack)** | Cloud orchestration platform |
| **Ceph (RBD)** | Distributed storage backend for images and volumes |
| **Glance** | Image service for storing VM images |
| **Cinder** | Block storage service backed by Ceph |
| **Packer** | Automated image builder |
| **cloud-init** | Instance initialization system |
| **Linux / Ubuntu Cloud Images** | Base operating system images |

---

# Architecture Overview

The system introduces an **automated image build pipeline** inside the OpenStack environment.

High-level flow:

1. A base cloud image is registered in Glance.
2. Packer launches a temporary **builder VM** in OpenStack.
3. The VM performs automated provisioning:
   - system updates
   - package installation
   - configuration
4. Cleanup tasks prepare the image for reuse.
5. The VM is stopped and **snapshotted into a new Glance image**.
6. The resulting image is stored in **Ceph RBD**.
7. Users launch virtual machines from the updated image.

More detailed architecture documentation can be found in:
* docs/03-high-level-architecture.md
* docs/04-software-architecture.md

---

# Current Lab Infrastructure

The project is implemented in a lab environment consisting of:

### OpenStack Node
* gelani-lab-1

Responsible for:

- DevStack deployment
- Packer execution
- VM orchestration
- Glance image management

### Ceph Cluster

| Node | Role |
|-----|------|
| gelani-mon-1 | Ceph Monitor |
| gelani-mon-2 | Ceph Monitor |
| gelani-mon-3 | Ceph Monitor |
| gelani-osd-1 | Ceph OSD |
| gelani-osd-2 | Ceph OSD |

Ceph provides:

- `images` pool → Glance backend
- `volume` pool → Cinder backend

This enables distributed storage for both images and VM volumes.

---

# Image Build Pipeline
## The automated pipeline works as follows:
```
Upstream Cloud Image
        │
        ▼
Glance Base Image
        │
        ▼
Packer Builder VM
        │
        ▼
Provisioning
• system updates
• package installation
• configuration
        │
        ▼
Cleanup
• remove temporary files
• reset machine-id
• clean cloud-init state
        │
        ▼
    Snapshot
        │
        ▼
Golden Image Published to Glance
        │
        ▼
Ceph RBD Storage
        │
        ▼
User VM Deployment
```

---

# Current Project Status

### Phase 1 — Completed

Automated **Ubuntu 24.04 Golden Image Build**

Achievements:

- Packer-based image build pipeline
- automated provisioning and cleanup
- image publishing to Glance
- Ceph RBD backend integration
- VM boot validation from generated image
- cloud-init verification
- updated OS packages

Validation results are documented in:
* phases/phase-01-v1-ubuntu-24-golden-image/

---

# Example Validation Result

A VM launched from the generated image shows:
* Ubuntu 24.04.4 LTS
* Kernel: 6.8.0-101-generic
* cloud-init: done
* Pending updates: none

This confirms the pipeline produces a **clean and updated OS image** ready for production use.

---

# Project Roadmap

The project is being developed in multiple phases.

### Phase 1
Ubuntu 24 automated golden image build  
**Status:** Completed

### Phase 2
Image release management
- versioning
- latest alias
- rollback support

### Phase 3
Scheduled automation
- cron/systemd automation
- unattended builds

### Phase 4
Multi-OS support
- Ubuntu 22.04
- Ubuntu 20.04
- additional distributions

### Phase 5
Ceph storage efficiency validation
- clone path verification
- snapshot lineage analysis

Full roadmap:
* docs/07-phase-roadmap.md

---

# Repository Structure
* docs/
design and architecture documentation

* phases/
implementation progress and validation

* packer/
Packer templates

* scripts/
provisioning and cleanup scripts

* assets/
architecture diagrams

* artifacts/
screenshots and logs

---

# Key Benefits

This system provides several improvements over manual image management:

- fully automated image creation
- consistently updated OS images
- reproducible builds
- faster VM deployment
- reduced administrative overhead
- better cloud user experience

---