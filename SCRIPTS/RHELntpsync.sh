sudo systemctl stop ntpd
sudo ntpdate  ntp.nict.jp
sudo systemctl start ntpd
sudo ntpq -p
date

