You will need to load the following:

1. git - "opkg install git" &  "opkg install git-http"
2. UniPwn - "git clone https://github.com/Bin4ry/UniPwn.git"
3. python3, python3-pip, Bleak - "opkg update && opkg install python3 python3-pip; pip install bleak"

I put the file in [ root/payloads/users/unipwn/payload.sh ]

start the payload, if you are missing any of the above you will get an error. once everything is correct it will alert you that it is armed and ready to start. it scans for targets for a duration and alerts back if no targets are detected. if a target is detected it should deploy the unipwn poc but i am unable to verify as i do not have a unitree robot to confirm. 
