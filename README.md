# Building a RHELAI ISO

This repo contains the final steps and files necessary to build the installation ISO for a Dev Preview RHELAI. The steps are from the source documentaiton here: https://github.com/RedHatOfficial/rhelai-dev-preview

The kickstart is located in ```src/kickstart```

1. Clone this repo, replace the SSH secret in the kickstart with your own.
2. Download the RHEL9 boot ISO from Red Hat at: https://developers.redhat.com/products/rhel/download?source=sso
3. Build the ISO using:  
   ```
   mkksiso ./src/kickstart/rhelai-dev-preview-bootc.ks rhel-9.4-x86_64-boot.iso rhelai-dev-preview-bootc-ks.iso
   ```  
4. Install the ISO on an appropriately spec'd server.

