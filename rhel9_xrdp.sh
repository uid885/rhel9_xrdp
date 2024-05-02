#!/bin/bash
#
# Author    : Christo Deale                  
# Date      : 2024-05-02            
# rhel9_xrdp: Utility setup & install XRDP for RHEL9             

# Add Enterprise Linux Repository
subscription-manager repos --enable codeready-builder-for-rhel-9-$(arch)-rpms
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
 
# Install xrdp
dnf -y install xrdp
 
# Start xrdp and enable at startup
systemctl start xrdp.service
systemctl enable xrdp.service
 
# Allow port 3389 through firewall and reload rules
firewall-cmd --add-port=3389/tcp --permanent
firewall-cmd --reload
