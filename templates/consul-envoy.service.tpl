[Unit]
Description=Consul Envoy
After=syslog.target network.target

# Put mesh gateway service token here for the -token option!
[Service]
ExecStart=/usr/local/bin/consul connect envoy -gateway=mesh -register -service "meshgateway" -address '{{ GetInterfaceIP "ens3" }}:8443' -wan-address "${floatingip}":8443 -expose-servers -token-file /etc/consul/tokens/gateway -- -l debug
ExecStop=/bin/sleep 5
Restart=always

[Install]
WantedBy=multi-user.target
