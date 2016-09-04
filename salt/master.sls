#!jinja|yaml|gpg
salt:
  master:
    file_ignore_regex:
      - '/\.svn($|/)'
      - '/\.git($|/)'
    fileserver_backend:
      - git
      - roots
    gitfs_provider: pygit2
    gitfs_remotes:
      - git@github.com:UGNS/salt-states.git:
        - base: master
        - privkey: /etc/salt/pki/gitfs/deploy.key
        - pubkey: /etc/salt/pki/gitfs/deploy.pub
    file_roots:
      base:
        - /srv/salt
    pillar_roots:
      base:
        - /srv/pillar
    ext_pillar:
        - git:
          - master git@github.com:UGNS/salt-pillars.git:
            - privkey: /etc/salt/pki/gitfs/deploy.key
            - pubkey: /etc/salt/pki/gitfs/deploy.pub
    pillar_opts: False
    order_masters: True
    winrepo_provider: gitpython
    rest_cherrypy:
      port: 8000
      ssl_crt: /etc/ssl/certs/undergrid.net-bundle.crt
      ssl_key: /etc/ssl/private/undergrid.net.key
    external_auth:
      pam:
        jbouse:
          - '.*'
    nodegroups:
      debian: 'G@os:Debian'
      ubuntu: 'G@os:Ubuntu'
      raspbian: 'G@os:Raspbian'
      windows: 'G@os:Windows'
      mail-servers: 'G@roles:mail:*'
      sks-servers: 'G@roles:sks:*'
      web-servers: 'G@roles:nginx:* or G@roles:apache:*'
      salt-servers: 'G@roles:salt:*'

  cloud:
    master: {{ grains.master }}

    providers:
      digital_ocean.conf:
        do-prod:
          driver: digital_ocean
          personal_access_token: |
            -----BEGIN PGP MESSAGE-----
            Version: GnuPG v1

            hQEMA3daYIEwiMseAQf+KtWW3IijUHURvI4GbjkLXuO2DAhJRWZgwS8RZ45WaHiZ
            JiSLteZZ1BW2yMC2+6umoILEJqYQ/jNYLxYJ12kPr1Jb2Xu2PcjsVfrqN/Lz+76B
            SuFq2QPkaxRc6azBWYwSi0+XiCMNaRcljWA4XHrx5LZQXE2UejsSj/Xjqdv30yYy
            JkaGRffqpeHAR71gqneomRJTgNpk3R+zKzxBGyKLjbWqUOUUkPhrqK0bXTvDPfFX
            w/908TMTB+i8LIJpD0jHhcD15mdzkEX9w93Zr9F7e+0W997i7vu0RdKHgoPAyBJ6
            +SOF22GskMmbAaYrtHh4J9yAnH58iim1f7HKmaO2kdJyAbcqQSbisyNUURVxlRht
            Qe2f+yBCziT++Vzg+HuERFsbCrBktppc0VK6IhaNykrNlCyTBRQjyheSCVt4tFKX
            9BSd4nMBZoE7WfmxO6AZGkdPfLns0JiSaXXl/t9+pLk5bU1lHl4bbwCkahaVBgdT
            Ez1e
            =/8d3
            -----END PGP MESSAGE-----
          ssh_key_name: digital-ocean-salt-cloud
          ssh_key_file: /etc/salt/pki/cloud/digital-ocean-salt-cloud.pem
          update_cachedir: True

      linode.conf:
        linode-prod:
          driver: linode
          apikey: |
            -----BEGIN PGP MESSAGE-----
            Version: GnuPG v1

            hQEMA3daYIEwiMseAQgAhbuQI1GUNlquzNrDMVGp3UnBc+x8I5HZ0ELxkkxxs/F0
            xtfUxjc5siD2rZgoIxuD6mXpQ6su6aqY4xIbX21Mbd5CD5j59KtzD8zkvChB1HHN
            a8KsUExKY8UzgPSVngQqekpexonKFvrfVIY4UsGxOUImtLlFTCmadoFewBHysxdv
            3kKlGsc6vUKR4wpMcizw3PZP8CZhS17oXQxegyXJckdzmSdeBvbewDIMSP2CNDPL
            Kf+T8LT38YciDBGTHg+0rftZrV+QKP65Upof+Hopi+udriXfkF4MSbGVSVAndozj
            amgf/AaYwgsdYY+uIlb6Qq+i0sbfpMEB4NbLxhVVZtJ7Afi+WQ0APObCffPgZR7v
            zTPVh6sOlwqZwFoqXW1upa0AkPgJ6B9RYhR/gUSQi59a36R2F3NEA1Vdk7vPoBmq
            K8E1BjfZEANy+o7hhNQSodynYyu5xQAQLCtwI2opIvDOftRVjd3tzQfa5iZLMEhG
            1BnxuQLmEMpP2pkv
            =rp31
            -----END PGP MESSAGE-----
          password: |
            -----BEGIN PGP MESSAGE-----
            Version: GnuPG v1

            hQEMA3daYIEwiMseAQgApIBkFNcAoCRb8kUjMKXd/1KsuPpZU1Io3FKNAilt/Y5/
            q8hEFSSTCDR1qgc/ilmc65hb1Pvv+Rx5L0md1Hi+BTsk8A8RIzbAnFQLVAlJdpHA
            3KxiWdGS5PO75byBX/8pEsKkqxhtGrMBko5Ph7CbWIrPs3y4odBVNzS4XxPW621P
            ql+ozIW07mzwATsKfh2sHMHFvDF34GCNjmsdqccA2Dqp7Ubbyha/PWT2NM50N6mb
            m3Z3ogLJzYPavtmialCq/7yV97+t3QBH7zms7+xYmtXPZQB/0BhoZROGhTfr0aqM
            Qey4ggFSPbYLwqo+nU1vpx3aw0d55niM7vqknCpljNJEASDLjGu+IG7dBOFyUOvy
            J0I8R7iz5i7zl1ecrUL+TeKeVTD37fzTEPiRPEdivY/Mn+UguaYJPi+HvoyC6ZFY
            pzaZSNk=
            =AwTs
            -----END PGP MESSAGE-----
          ssh_pubkey: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDzcspOOekBLdl/DXvHDdO+I7ew1qNByULARAkKxUEfVwFQ1XJm7DciQkWPqQYfTJKTMteGRQpNep9RzVpPx/3gambm1fnGdyDdKVxQ2rKjJBuT3iBSXs3D+jH9IcovqRsECErnm4KJJzqof/8vYsnff0LTIOomehu7TxiBwExZ+RZZcerrg77NxuEOhiJ5u9BLG5CmL8TkUwGfwwA9Yc9Lq9gZxtBbDKoebxC0JojG1m7YwNPLWS/8I64vBfvxF/jtTSFbVywaIxjD5Ge411sDOoozL2/SW0o8ShYHJw5ujEE33+w72SymILeox8JVNeCTUhMe0bAEykuRHzvbvBzd root@salt01.undergrid.net
          ssh_key_file: /etc/salt/pki/cloud/linode-salt-cloud.pem

    profiles:
      digital_ocean.conf:
        debian_512MB_NYC3:
          provider: do-prod
          image: 8.5 x64
          size: 512MB
          location: New York 3
          private_networking: True
          ipv6: True
          update_cachedir: True

        debian_1GB_NYC3:
          provider: do-prod
          image: 8.5 x64
          size: 1GB
          location: New York 3
          private_networking: True
          ipv6: True
          update_cachedir: True

      linode.conf:
        ubuntu_2GB_ATL:
          provider: linode-prod
          size: Linode 2048
          image: Ubuntu 16.04 LTS
          location: Atlanta, GA, USA

        debian_2GB_ATL:
          provider: linode-prod
          size: Linode 2048
          image: Debian 8
          location: Atlanta, GA, USA

    maps:
      sks.map:
        debian_1GB_NYC3:
          - sks01.undergrid.net:
              grains:
                roles: sks:frontend
          - sks02.undergrid.net:
              grains:
                roles: sks:backend
          - sks03.undergrid.net:
              grains:
                roles: sks:backend

      mail.map:
        debian_1GB_NYC3:
          - amvs01.undergrid.net:
              grains:
                roles: mail.filter

        debian_512MB_NYC3:
          - mail02.undergrid.net:
              grains:
                roles: mail:mx

        debian_2GB_ATL:
          - mail01.undergrid.net:
              grains:
                roles:
                  - mail:mx
                  - mail:filter

      salt-master.map:
        ubuntu_2GB_ATL:
          - control:
              grains:
                roles: salt:master
              minion:
                id: control.undergrid.net

  minion:
    master: salt.{{ grains.domain }}

  gitfs:
    keys:
      deploy:
        key: |
          -----BEGIN PGP MESSAGE-----
          Version: GnuPG v1

          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
          =Tchv
          -----END PGP MESSAGE-----

        pub: |
          ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCjfZq+oJhHDfAGjjczuP5UmWY1onYi87o8lXT7k690mOD0bxFDZWRhNXcPfjnc4F7ya+vlzV5BtqnBiFFKIekmXC3w8hhV7YbLuPNQLr+qFKsylxM76/ean+KbUvPjgpITFGjXhJ3WDLKGCon2DT/YQuEHOOlpZUEWSZ8AQTVTCLxDX5WrkbwTVIGUJWsD+H4hBhmFhzqbjfmEIa7A7dwNZthptUbSwqg5suD6rstAJH2YVh8Jur7D9UVJdY1qUbQKICo7CGvmjS8KdabcBDJjHZO4H76xmgTEYTDJf0CxDk6iEup2NDi+f9QpQlst5nTPzo4I0M0lkx15KAFv9UdbSjjujCUakawxdcD/jpFjcLw8UmtoFgExvY0zP5kP1soCC1VG+DEYXmvGqT/9HXbLP8/Ydl6eyF/H58KXBfSZY6V6Mb7BQmMQ0Cwag/LeI+EmocKUcO1Gg9SoObjgvp/uAiN++hfnu1g51gkWzMBod0xX6kzGgFfUHnk+4C+QDME8cgp8MYjPeYSAx0vM5bKWN2qL9yALl72mciJT/JPWBsSuojHiA9zOCXTl7CnbrAbrjhNB0MrFXsNxj3lPjDAXMzWYjPh+QzNr3j/b4uwD7QsQTIUDZO7k8L0mNqyhe5GEbxlnQ9aTU6TKuV7bLIcexQ8p/d8Fy4iXZg1P1XCnjQ== Salt Deploy

  reactor:
    - 'sks/keydump/ready':
      - salt://reactor/sks/keydump.sls
    - 'salt/cloud/*/created':
      - salt://reactor/highstate.sls
    - 'salt/cloud/*/destroyed':
      - salt://reactor/clear_cache.sls

salt_cloud_certs:
  digital-ocean-salt-cloud:
    pem: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v1

      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
      TtA=
      =+v5I
      -----END PGP MESSAGE-----
  linode-salt-cloud:
    pem: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v1

      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
      =XQxu
      -----END PGP MESSAGE-----

salt_formulas:
  git_opts:
    # The Git options can be customized differently for each
    # environment, if an option is missing in a given environment, the
    # value from "default" is used instead.
    default:
      # URL where the formulas git repositories are downloaded from
      # it will be suffixed with <formula-name>.git
      baseurl: https://github.com/UGNS
      # Directory where Git repositories are downloaded
      basedir: /srv/formulas
      # Update the git repository to the latest version (False by default)
      update: True
      # Options passed directly to the git.latest state
      options:
        branch: master
        force_reset: True
        force_fetch: True
    dev:
      basedir: /srv/formulas/dev
      update: True
      options:
        branch: develop
  # Options of the file.directory state that creates the directory where
  # the git repositories of the formulas are stored
  basedir_opts:
    makedirs: True
    user: root
    group: root
    mode: 755
  # List of formulas to enable in each environment
  list:
    base:
      - apache-formula
      - bind-formula
      - cert-formula
      - dhcpd-formula
      - dovecot-formula
      - jenkins-formula
      - logrotate-formula
      - nginx-formula
      - ntp-formula
      - openssh-formula
      - openvpn-formula
      - php-formula
      - postfix-formula
      - reverse-grains-formula
      - rsyslog-formula
      - salt-formula
      - sks-formula
      - sudoers-formula
      - users-formula
      - duo-formula
      - fail2ban-formula
      - nfs-formula
      - snmp-formula
      - speedcomplainer-formula
      - raspberrypi-formula
