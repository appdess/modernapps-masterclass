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
