#!/usr/bin/expect

set timeout 10
set ip "10.0.19.1"
set user "admin"
set password "rbhgbxdjryf"

spawn telnet $ip
expect "Login:"
send "$user\r"
expect "Password:"
send "$password\r"
sleep 5
expect ">"
send "/snmp set enabled=yes\r"
expect ">"
send "quit\r"
expect eof
