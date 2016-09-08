sks:
  lookup:
    build_opts: -n 2 -cache 30

  config:
    hostname: sks.undergrid.net
    server_contact: '0x15D0A62ED01E190C'
    initial_stat: ''
    disable_mailsync: ''
    membership_reload_interval: 1
    stat_hour: 18
    debug: ''
    debuglevel: 3

mine_interval: 5
mine_functions:
  external_ip_addrs:
    mine_function: network.ip_addrs
    interface: eth0
  internal_ip_addrs:
    mine_function: network.ip_addrs
    interface: eth1

snmp:
  conf:
    location: 'New York City, NY'
