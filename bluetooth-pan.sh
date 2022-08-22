#!/bin/bash
tee /etc/systemd/network/pan0.netdev << EOF
[NetDev]
Name=pan0
Kind=bridge
EOF

tee /etc/systemd/network/pan0.network << EOF
[Match]
Name=pan0
[Network]
Address=172.20.1.1/24
DHCPServer=yes
EOF

tee /etc/systemd/system/bt-agent.service << EOF
[Unit]
Description=Bluetooth Auth Agent
[Service]
ExecStart=/usr/bin/bt-agent -c NoInputNoOutput
Type=simple
[Install]
WantedBy=multi-user.target
EOF

tee /etc/systemd/system/bt-network.service << EOF
[Unit]
Description=Bluetooth NEP PAN
After=pan0.network
[Service]
ExecStart=/usr/bin/bt-network -s nap pan0
Type=simple
[Install]
WantedBy=multi-user.target
EOF

systemctl enable systemd-networkd
systemctl enable bt-agent
systemctl enable bt-network
systemctl start systemd-networkd
systemctl start bt-agent
systemctl start bt-network
bt-adapter --set Discoverable 1
