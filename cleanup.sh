#!/bin/bash

# Quick Cleanup so nothing get´s locked before cloning to new master image

# Unlock Chrome (otherwise process locked by current user)
rm -rf ~/.config/google-chrome/Singleton*

# Remove History from bash
history -c
