ip:
  blacklist: |
    222.184.0.0/13
    182.96.0.0/12
    43.229.52.0/22
    218.64.0.0/16
    218.65.0.0/17
    113.194.0.0/15
    218.87.0.0/16
    221.200.0.0/14
    132.255.0.0/16
    177.8.144.0/21
    109.161.192.0/18
    195.182.128.0/19
    176.98.128.0/19
    79.51.128.0/17
    81.72.0.0/14
    95.31.152.0/21
    95.31.160.0/19
    95.31.192.0/18
    185.11.224.0/22
    5.133.48.0/21
    109.94.0.0/19
    82.118.234.0/24
    185.109.144.0/22
    107.158.172.0/24

fail2ban:
  lookup:
    config:
      loglevel: 2
    jails:
      DEFAULT:
        bantime: 3600
        destemail: hostmaster@undergrid.net
        sender: hostmaster@undergrid.net
        action_ugns:
          - '%(banaction)s[name=%(__name__)s, port="%(port)s", protocol="%(protocol)s", chain="%(chain)s"]'
          - 'badips[name=%(__name__)s]'
          - '%(mta)s-whois[name=%(__name__)s, dest="%(destemail)s", protocol="%(protocol)s", chain="%(chain)s", sender=%(sender)s, sendername="%(sendername)s"]'
        action: '%(action_ugns)s'
      recidive:
        enabled: True
        action:
          - 'iptables-allports[name=%(__name__)s, protocol="%(protocol)s", chain="%(chain)s"]'
          - '%(mta)s-whois-lines[name=%(__name__)s, dest="%(destemail)s", logpath=%(logpath)s, sender=%(sender)s, sendername="%(sendername)s"]'
      blacklist:
        enabled: True
        action:
          - blacklist[name=%(__name__)s]
    actions:
      badips:
        Definition:
          actionban: 'curl --fail --user-agent "fail2ban v0.8.12" http://www.badips.com/add/<category>/<ip>'
        Init:
          category: '<name>'
      blacklist:
        Definition:
          actionstart:
            - iptables -N fail2ban-<name>
            - iptables -A fail2ban-<name> -j RETURN
            - iptables -I <chain> -j fail2ban-<name>
            - cat /etc/fail2ban/ip.<name> | while read IP; do iptables -I fail2ban-<name> 1 -s $IP -j DROP; done
          actionstop:
            - iptables -D <chain> -j fail2ban-<name>
            - iptables -F fail2ban-<name>
            - iptables -X fail2ban-<name>
        Init:
          chain: INPUT
