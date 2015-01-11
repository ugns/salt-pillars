grains:
  roles:
    salt:master:
      - G@id:control.undergrid.net
    salt:syndic:
      - G@host:salt* and not G@roles:salt:master
    sks:backend:
      - G@host:sks* and not G@host:*01
    sks:frontend:
      - G@host:sks01
    sks:test:
      - G@host:key01
    nginx:lb:
      - G@host:wlb01
    apache:roundcube:
      - G@host:web01
    apache:postfixadmin:
      - G@host:web02
    apache:vhosts:
      - G@host:web03
    database:mysql:
      - G@host:db01
    mail:mx:
      - G@host:mail*
    mail:mailbox:
      - G@host:smtp*
    mail:filter:
      - G@host:amvs*
    laptop:
      - G@host:solitare
      - G@host:tatiana
      - G@host:verity
    tor:
      - G@host:rpi02
    speedcomplainer:
      - G@host:rpi01
    ntp:master:
      - G@host:rpi01
    ntp:peer:
      - G@host:control
