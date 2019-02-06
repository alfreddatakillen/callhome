CONFIGURE YOUR PUBLICLY ACCESSIBLE SERVER:
------------------------------------------

### 1.

Add this to /etc/ssh/sshd_config:

    ClientAliveInterval 5
    ClientAliveCountMax 3
    GatewayPorts yes


### 2.

Add user on the publicly accessible server:

    useradd --system --home-dir /etc/ssh/revssh --no-log-init --create-home --shell /bin/false revssh


### 3.


Clean up the revssh user's home dir:


    rm -Rf /etc/ssh/revssh/* /etc/ssh/revssh/.*


### 4.

Create authorized keys file for the revssh user:

    mkdir /etc/ssh/revssh/.ssh


Now, copy your non-publicly available server's id_rsa.pub file to /etc/ssh/revssh/.ssh/authorized_keys

Fix the permissions:

    chown -R revssh:revssh /etc/ssh/revssh/.ssh



CONFIGURE YOUR SERVER BEHIND A FIREWALL:
----------------------------------------

1.

Edit the callhome.sh variables in the file top.


2.

Run callhome.sh every minute with a cronjob:

	* * * * * /home/alfred/callhome/callhome.sh


