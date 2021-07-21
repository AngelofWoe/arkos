#!/bin/bash
sudo systemctl start solarushotkey
cd /opt/solarus/
/opt/solarus/solarus-run "$1"
sudo systemctl stop solarushotkey
