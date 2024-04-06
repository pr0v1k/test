#!/bin/bash

gateway="10.0.0.1"
netmask="255.255.224.0"
dns_servers=("10.0.22.252" "192.168.77.54")

get_domain_name() {
    ip_address=$1
    for dns_server in "${dns_servers[@]}"; do
        domain_name=$(dig +short -x $ip_address @$dns_server)
        if [ ! -z "$domain_name" ]; then
            echo $domain_name
            return
        fi
    done
    echo ""
}

> hosts.txt

for ip in {1..254}; do
    ip_address="10.0.10.$ip"

    if ping -c 1 -W 1 $ip_address &> /dev/null; then
        domain_name=$(get_domain_name $ip_address)
        echo "$ip_address $domain_name" >> hosts.txt
    fi
done
