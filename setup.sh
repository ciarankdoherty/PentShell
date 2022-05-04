clear
echo "BLACKSH INSTALLER SCRIPT ;BY XYNMAPS;"
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
echo "UPDATING PACKAGE LISTS..."
apt-get update -y
echo "INSTALLING WGET..."
apt install wget -y
logdate=`date`
echo "INSTALLING PYTHON2..." 
apt install python2 -y
echo "INSTALLING AND STARTING TOR..."
apt install tor -y
tor &
echo "INSTALLING AND CONFIGURING PROXYCHAINS..."
apt install proxychains -y
echo "socks4 127.0.0.1 9050" >> /etc/proxychains.conf
echo "quiet_mode" >> /etc/proxychains.conf
echo "CREATING LOGDIR/LOGFILE..."
mkdir /opt/blacksh
echo "logfile created at $logdate" >> /opt/blacksh/log.txt
echo "clear" >> .blacksh_history
echo "WGETTING COLORS MODULE..."
wget https://pastebin.com/raw/jFzVbx71 -O colors.py
echo "SETUP DONE."
