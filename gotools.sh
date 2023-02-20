#!/bin/bash

echo "ClientAliveInterval 20" >>/etc/ssh/sshd_config
echo "ClientAliveCountMax 3" >> /etc/ssh/sshd_config
systemctl restart sshd

wget -q https://go.dev/dl/go1.18.3.linux-amd64.tar.gz -O /tmp/go.tar.gz && tar -xzf /tmp/go.tar.gz -C /usr/local/ && rm -rf /tmp/go.tar.gz 
GOROOT=/usr/local/go
GOPATH=/home/gopath
cat <<EOF >/etc/profile.d/goroot.sh
export GOROOT=$GOROOT
export GOPATH=$GOPATH
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
EOF
source /etc/profile
echo 'go version'
go version

yum install -y gcc && yum install -y libpcap-devel
go install -v github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
go install -v github.com/projectdiscovery/dnsx/cmd/dnsx@latest
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
go install -v github.com/zu1k/nali@latest
go install -v github.com/tomnomnom/anew@latest
exit 1