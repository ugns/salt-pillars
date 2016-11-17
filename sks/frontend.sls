#!jinja|yaml|gpg
sks:
  config:
    hkp_address: {{ grains.ip_interfaces['lo'][0] }}
  membership:
    keys2.kfwebs.net:
      admin: Kristian Fiskerstrand
      keyid: '0x0B7F8B60E3EDFAE3'
    sks.fidocon.de:
      admin: dirk astrath
      email: dastrath@gmx.de
      keyid:  '0x8351e0af or 0x2840c708'
    keys.andreas-puls.de:
      admin: Andreas Puls
      email: appu@gmx.net
      keyid: '0xDAC73FA6'
    keyserver.durcheinandertal.ch:
      admin: Gaudenz Steinlin
      email: gaudenz@durcheinandertal.ch
      keyid: '0xBAF91EF5'
    keyserver.cns.vt.edu:
      email: keymaster@cns.vt.edu
      keyid: '0x49F86D9B'
    keyserver.witopia.net:
      admin: Nat Howard
      email: nrh+sks-devel@witopia.net
      keyid: '0x84DA02B1 or 0x5395290B'
    keyserver.sincer.us:
      admin: Petru Ghita
      email: petrutz@venaver.info
      keyid: '0x7CF29D04'
    keyserver.skoopsmedia.net:
      admin: Adam Lewicki
      email: adam@lewicki.at
      keyid: '0xF3E88A9F'
    pks.aaiedu.hr:
      admin: Dinko Korunic
      email: kreator@srce.hr
      keyid: '0xEA160D0B'
    keyserver.siccegge.de:
      admin: Christoph Egger
      email: christoph.egger@gmx.de
      keyid: '0x965522B9D49AE731'
    keyserver.blupill.com:
      admin: BluKeyserver
      email: keyserver@blupill.com
      keyid: '0xB9865CB5'
    keyserver2.computer42.org:
      admin: H. Dirk Schmitt
      email: dirk@computer42.org
      keyid: '0x9E6313F2611EB3FBD7F9E8E824C1A3786A017B17'
    keyserver.matteoswelt.de:
      admin: Matthias Schreiber
      email: schreiber-matti@web.de
      keyid: '0x586A2E13F52616561BFC32C95B964AE610D49726'
    sks.openpgp-keyserver.de:
      admin: Matthias Schreiber
      email: schreiber-matti@web.de
      keyid: '0x586A2E13F52616561BFC32C95B964AE610D49726'
    keys.alderwick.co.uk:
      admin: Andrew Alderwick
      email: andrew@alderwick.co.uk
      keyid: '0x3ABB8CDAC6BEA800'
    keys2.alderwick.co.uk:
      admin: Andrew Alderwick
      email: andrew@alderwick.co.uk
      keyid: '0x3ABB8CDAC6BEA800'
    keyserver.ubuntu.com:
      admin: Haw Loeung
      email: haw.loeung@canonical.com
      keyid: '0xFA5C7D29'

nginx:
  ng:
    vhosts:
      managed:
        sks:
          enabled: True
          config:
            - server:
              - listen:
                - {{ grains.ip_interfaces['eth0'][0] }}:11371
                - default_server
              - listen:
                - {{ grains.ip_interfaces['eth1'][0] }}:11371
                - default_server
              - listen:
                - {{ grains.ip_interfaces['eth0'][0] }}:80
                - default_server
              - listen:
                - "[{{ grains.ip6_interfaces['eth0'][0] }}]:11371"
                - default_server
                - ipv6only=on
              - listen:
                - "[{{ grains.ip6_interfaces['eth0'][0] }}]:80"
                - default_server
                - ipv6only=on
              - access_log: 'off'
              - server_tokens: 'off'
              - location /:
                - root: /srv/www
                - index: index.html
              - location /pks:
                - proxy_pass: http://sks_servers/pks
                - proxy_set_header:
                  - Host
                  - $host
                - proxy_set_header:
                  - X-Real-IP
                  - $remote_addr
                - proxy_set_header:
                  - X-Forwarded-For
                  - $proxy_add_x_forwarded_for
                - proxy_set_header:
                  - X-Forwarded-Proto
                  - $scheme
                - proxy_set_header:
                  - X-Forwarded-Port
                  - $server_port
                - proxy_pass_header: Server
                - proxy_ignore_client_abort: 'on'
                - add_header:
                  - Via "1.1 sks.undergrid.net:$server_port (nginx)"
                - client_max_body_size: 8m

            - server:
              - listen:
                - {{ grains.ip_interfaces['eth0'][0] }}:443
                - default_server
                - ssl
              - listen:
                - "[{{ grains.ip6_interfaces['eth0'][0] }}]:443"
                - default_server
                - ssl
                - ipv6only=on
              - access_log: 'off'
              - server_tokens: 'off'
              - ssl_certificate: /etc/ssl/certs/sks.undergrid.net.crt
              - ssl_certificate_key: /etc/ssl/private/sks.undergrid.net.key
              - ssl_trusted_certificate: /etc/ssl/certs/sks-keyservers.net.ca.crt
              - ssl_protocols:
                - TLSv1
                - TLSv1.1
                - TLSv1.2
              - ssl_prefer_server_ciphers: 'on'
              - ssl_dhparam: /etc/ssl/dhparams.pem
              - ssl_ciphers:
                - 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS'
              - add_header:
                - Strict-Transport-Security 'max-age=31536000'
              - add_header:
                - Public-Key-Pins 'pin-sha256="Xnu7zI1oPbsQ4x47NpJVpOiMPPC3rLO81mTuKMiEjlI="; pin-sha256="9eGb55deEj42vOObXCSswgduvM5JNB7z/PriVx/AQUo="; max-age=315366000'
              - location /:
                - root: /srv/www
                - index: index.html
              - location /pks:
                - proxy_pass: http://sks_servers/pks
                - proxy_set_header:
                  - Host
                  - $host
                - proxy_set_header:
                  - X-Real-IP
                  - $remote_addr
                - proxy_set_header:
                  - X-Forwarded-For
                  - $proxy_add_x_forwarded_for
                - proxy_set_header:
                  - X-Forwarded-Proto
                  - $scheme
                - proxy_set_header:
                  - X-Forwarded-Port
                  - $server_port
                - proxy_pass_header: Server
                - proxy_ignore_client_abort: 'on'
                - add_header:
                  - Via "1.1 sks.undergrid.net:$server_port (nginx)"
                - client_max_body_size: 8m

cert:
  certlist:
    sks-keyservers.net.ca: {}
    sks.undergrid.net:
      key: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v2

        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
        57QDjXv1
        =i9jP
        -----END PGP MESSAGE-----
