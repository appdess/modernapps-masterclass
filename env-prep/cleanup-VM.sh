#!/bin/bash

# Quick Cleanup so nothing get´s locked before cloning to new master image

# Unlock Chrome (otherwise process locked by current user)
rm -rf ~/.config/google-chrome-beta/Singleton*
rm -rf ~/.config/google-chrome

# remove TKG-Config
rm -rf ~/.tkg
rm -rf ~/.kube
#
# Remove History from bash
history -c

# Automation
docker run --rm -it vmware/powerclicore 

$VMCVMFolder = "Workloads"
$VMCResourcePool = "Compute-ResourcePool"
$VMCDatastore = "WorkloadDatastore”


$NewVMName = ”photon-clone2"
$VMTemplate = "photon-3-kube-v1.18.2-vmware.1"
New-VM -Name $NewVMName -Template (Get-Template $VMTemplate) -Location (Get-Folder $VMCVMFolder) -ResourcePool (Get-ResourcePool $VMCResourcePool) -Datastore (Get-Datastore $VMCDatastore)


Recommended Global variables 
$apiToken="OrqoRHE5DIcIkJUdJiF49fzly1ejdrU0J8Ngkk7ciDk5sGeEtJRB2tZWuC2Ahemn"
$OrgName=“VMC-SET-EMEA”
$SDDCName=“TKG_WS_SDDC”

Connect-Vmc -ApiToken $apiToken
Connect-NSXTProxy -RefreshToken $apiToken -OrgName $OrgName -SDDCName $SDDCName

Get-NSXTNatRule
Get-NSXTPublicIP
Get-NSXTInfraGroup
Get-NSXTSegment

Managing FW-Rules with Powershell

Get-NSXTDistFirewall -SectionName "WS-Test" | ft

View the “MGW” or “CGW” NSXTGroups
Get-NSXTGroup –GatewayType CGW | ft 


New-NSXTDistFirewall -Name ”Deny-NSX-T" -Section "WS-Test” `
-SourceGroup "Any" `
        -DestinationGroup "TitoFE_IP" `
        -Service http -Logged $true `
        -SequenceNumber 5 `
        -Action DROP


        IuIfVuHBu9T5+!d

