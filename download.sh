#/bin/bash

# Wrapper to download init file and execute

curl -o init.sh https://raw.githubusercontent.com/Fmrhj/python-project-init/main/init.sh &> /dev/null && chmod +x init.sh
./init.sh
