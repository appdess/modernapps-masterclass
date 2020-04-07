#!/usr/bin/env bash

########################
# include the magic
########################
. ./demo-magic.sh


########################
# Configure the options
########################

#
# speed at which to simulate typing. bigger num = faster
#
TYPE_SPEED=35

#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W "

# hide the evidence
clear


# Set working directory
pe "cd /Users/adess/git/tkg-vmc"

# Setup our control-plane
pe "tkg init --ui &"
pe "PID=$!"
pe "kill $PID"


# check our TKG control plane
pe "tkg get cluster"
pe "kubectl config use-context tkg-mgmt-admin@tkg-mgmt"
pe "kubectl get clusters"
pe "kubectl get machines"

# Create Storage-Class for the Cluster
pe "kubectl config use-context techsummit-admin@techsummit"
pe "kubectl get nodes -o wide"
pe "cat sc.yaml"
pe "kubectl apply -f sc.yaml" 

# deploy RocketChat Application via helm
pe "helm install rocketchat stable/rocketchat --set persistence.StorageClass=standard,mongodb.mongodbPassword=password,mongodb.mongodbRootPassword=password,service.type=LoadBalancer"

# Show Cluster Storage integration
pe "kubectl get deploy"
pe "kubectl get pvc"
pe "kubectl get svc"

# cleanup the stuff
pe "helm uninstall rocketchat & kubectl delete sc --all & kubectl delete pvc --all &"

# Use context to show chat.alexdess.cloud
pe "kubectl config use-context adess-admin@adess"
pe "kubectl get svc"

# Create a new Demo Cluster in tkg
pe "tkg create cluster  techsummit$RANDOM --plan=dev --kubernetes-version=v1.17.3+vmware.1 -q &"
pe "tkg get cluster"
pe "tkg scale cluster techsummit -w 6"
# show a prompt so as not to reveal our true nature after
# the demo has concluded
p ""
