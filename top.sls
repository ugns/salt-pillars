base:
  '*':
    - salt
    - grains
    - ntp
    - postfix
    - fail2ban
    - users
    - ssh
    - aws
    - base
    - snmp

  'control.undergrid.net':
    - salt.engines.slack

  'G@cpuarch:armv7l and G@os:Raspbian':
    - match: compound
    - raspberrypi

  'G@domain:undergrid.net':
    - duo

  'G@roles:salt:*':
    - salt.master

  'G@roles:salt:master':
    - cert
    - cert.bundles

  'G@roles:salt:syndic':
    - salt.syndic

  'G@roles:salt:* and G@environment:vagrant':
    - salt.vagrant

  'G@roles:sks:*':
    - sks

  'G@roles:sks:backend':
    - sks.backend

  'G@roles:sks:frontend':
    - sks.frontend
    - nginx

  'G@roles:apache:*':
    - apache

  'G@roles:nginx:*':
    - nginx

  'G@roles:nginx:lb':
    - cert
    - nginx.fallthrough
    - nginx.webmail
    - nginx.webmail.undergrid
    - nginx.webmail.alternativehaven
    - nginx.webmail.vistalakehoa
    - nginx.webmail.focuscounseling

  'G@roles:mail:*':
    - duo

  'G@roles:mail:mx':
    - cert
    - cert.bundles
    - postfix.relay

  'G@roles:mail:mailbox':
    - cert
    - cert.bundles
    - postfix.smtp

  'G@roles:mail:filter':
    - postfix.filter

  'G@roles:database:*':
    - duo

  'G@roles:vpn:*':
    - duo

  'G@roles:ntp:master':
    - ntp.master

  'G@roles:ntp:peer':
    - ntp.peer

  'G@roles:speedcomplainer':
    - speedcomplainer

  'G@roles:laptop':
    - salt.laptop
