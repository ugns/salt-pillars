#!yaml|gpg
snmp:
  conf:
    location: 'Atlanta, GA'
    syscontact: 'Jeremy T. Bouse <Jeremy.Bouse@UnderGrid.net>'
    logconnects: false
    views:
      - name: all
        type: included
        oid: '.1'
        mask: 80
    rousers:
      - username: 'monitoring'
        passphrase: |
          -----BEGIN PGP MESSAGE-----
          Version: GnuPG v2

          hQEMA3daYIEwiMseAQgAhCt8Y367fAiPAXFf1O4StjICQYWbNqe/RS9nZ+3TLrob
          c/IvJhPgS6SbHBnojnkRlGyXT7tbMuOeHefZxkFZjTWrsK1yHj/ls+9vSz/wPRf3
          gVWk5ib1vnGrtUIpfBfx31yyqZEFY8z5LAPqocgeq9NIHPH5f6Xzm+eeUyv2RodA
          FF5gq7s/7gX3HxQA+j7hGdUSy4yioybFvJgwwh1memIrpIiSntRGBace/SE2zu6H
          udsC6P0VFn0ChXw5tRTc/ygQAZHrbDE7bJj47WTokIaq71Yysy+hzK07XQZCx+Ud
          deisutiTa1RDo3Onz67FHDgOMbfpgBXi7grVb89xhtJLATaRzqSQJ6jyDL26nPan
          NhW6loKx5Vqt/Bj5QUHWKPqRs6Xt7TtJ5FZ6DkhydJrMfpyALQlOn2XoetvmxBC9
          lP/LgM8eyZdH1oGK
          =+Ny0
          -----END PGP MESSAGE-----
        view: all
        authproto: 'SHA'
        privproto: 'AES'
    settings:
      agentAddress: 'udp:161,udp6:[::1]:161'
      sysServices: 72
      master: ['agentx']
