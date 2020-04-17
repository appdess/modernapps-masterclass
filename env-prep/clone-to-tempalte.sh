#!/bin/bash

export VMNAME=tkg-ws4
govc vm.clone -vm $VMNAME tkg-masterimage1.0
govc vm.markastemplate tkg-masterimage1.0

