# Problem Statement 

## Two main pain points:

### Problem 1: manual image operations

The admin has to:

* download upstream image
* upload to Glance
* maybe boot and test it
* maybe patch it manually
* maybe snapshot/recreate it
* repeat for many distros

That does not scale.

### Problem 2: users expect “fresh” images

When a user launches Ubuntu 24.04, they expect:

* latest security updates
* recent kernel
* proper cloud-init
* no stale package indexes
* a clean boot experience

cloud providers solve this with **image pipelines**, not by an engineer manually clicking “create image” every day. AWS documents this with services like **EC2 Image Builder**, which automates creating and managing customized AMIs, and AWS also supports AMI lifecycle automation such as retention, deprecation, and replacement.

## The best way to think about your OpenStack solution


### **OpenStack Image Factory**

A system that automatically:

* fetches latest upstream base cloud image
* boots a temporary OpenStack builder VM
* updates and prepares the OS
* optionally tests it
* publishes a new Glance image
* tags it as current
* retires old images