#!/bin/bash

# Quick Cleanup so nothing get´s locked before cloning to new master image

# Unlock Chrome (otherwise process locked by current user)
for i in {1..20}
do
tkg init --infrastructure=vsphere
tkg create cluster -p dev
done

