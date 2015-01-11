nginx:
  ng:
    vhosts:
      managed:
        webmail.undergrid:
          enabled: True
          config:
            - server:
              - server_name:
                - webmail.undergrid.net
                - imap.undergrid.net
              - listen:
                - 443
                - ssl
              - access_log: 'off'
              - server_tokens: 'off'
              - ssl_certificate: /etc/ssl/certs/undergrid.net.crt
              - ssl_certificate_key: /etc/ssl/private/undergrid.net.key
              - ssl_trusted_certificate: /etc/ssl/certs/sca.server3.crt
              - ssl_dhparam: /etc/ssl/dhparams.pem
              - ssl_ciphers:
                - 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS'
              - ssl_stapling: 'on'
              - ssl_stapling_verify: 'on'
              - add_header:
                - Strict-Transport-Security 'max-age=31536000'
              - add_header:
                - Public-Key-Pins 'pin-sha256="gzfGUUlu7tXnxEMXYVam6okv4zKMkdklF6FWaRAuVhg="; pin-sha256="5SzpzAvKPcuCnphngHDKLm+DSF0saaDAFtpgOuTvhlQ="; max-age=315366000'
              - location /:
                - proxy_pass: http://roundcube
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
                - client_max_body_size: 8m
              - location /postfixadmin:
                - proxy_pass: http://postfixadmin
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
                - client_max_body_size: 8m
