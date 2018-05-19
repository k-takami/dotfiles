tail -f /var/log/httpd/access_log &
tail -f /var/log/httpd/error_log &
tail -f /opt/enju-flower/log/production.log &
tail -f /opt/enju-management/log/production.log &

