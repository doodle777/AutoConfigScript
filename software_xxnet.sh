#! /bin/bash
## 
sudo apt-get install python-openssl
sudo apt-get install libffi-dev
sudo apt-get install -y python-gtk2
sudo apt-get install python-appindicator
sudo apt-get install libnss3-tools

rm -r ~/Software/XX-Net/data/gae_proxy/certs
rm ~/Software/XX-Net/data/gae_proxy/CA.crt

~/Software/XX-Net/start
