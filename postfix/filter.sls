postfix:
  config:
    relayhost: smtp.undergrid.net

mine_interval: 5
mine_functions:
  external_ip_addrs:
    mine_function: network.ip_addrs
    interface: eth0
  internal_ip_addrs:
    mine_function: network.ip_addrs
    interface: eth1
