nginx:
  ng:
    vhosts:
      managed:
        webmail.alternativehaven:
          enabled: True
          config:
            - server:
              - server_name:
                - webmail.alternativehaven.com
                - imap.alternativehaven.com
              - listen:
                - 443
                - ssl
              - access_log: 'off'
              - server_tokens: 'off'
              - ssl_certificate: /etc/ssl/certs/www.alternativehaven.com.crt
              - ssl_certificate_key: /etc/ssl/private/www.alternativehaven.com.key
              - ssl_trusted_certificate: /etc/ssl/certs/sub.class2.server.ca.crt
              - ssl_dhparam: /etc/ssl/dhparams.pem
              - ssl_ciphers:
                - 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS'
              - ssl_stapling: 'on'
              - ssl_stapling_verify: 'on'
              - add_header:
                - Strict-Transport-Security 'max-age=31536000'
              - add_header:
                - Public-Key-Pins 'pin-sha256="gm1OBjHWL0+rSxemHNBKTTxZAbPaLudcFO8OtpMYOOE="; pin-sha256="wiVMb37HT6gcl/x4KjGVKsYSYG5EZ6in1TnI3hZ62YE="; pin-sha256="5SzpzAvKPcuCnphngHDKLm+DSF0saaDAFtpgOuTvhlQ="; max-age=3600'
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
