#!/bin/bash

export GOVC_INSECURE=1 # Don't verify SSL certs on vCenter
export GOVC_URL=https://vcenter.sddc-3-127-192-136.vmwarevmc.com #vCenter IP/FQDN
export GOVC_USERNAME=cloudadmin@vmc.local # vCenter username
export GOVC_PASSWORD=VMware1! # vCenter password
export GOVC_DATASTORE=WorkloadDatastore # Default datastore to deploy to
export GOVC_NETWORK=TKGonVMC # Default network to deploy to
export GOVC_RESOURCE_POOL=/SDDC-Datacenter/host/Cluster-1/Resources/Compute-ResourcePool # Default resource pool to deploy t
export GOVC_FOLDER=tkg