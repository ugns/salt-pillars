nginx:
  ng:
    vhosts:
      managed:
        fallthrough:
          enabled: True
          config:
            - upstream webservers:
              - server: web03.atl.undergrid:80

            - server:
              - server_name: _
              - listen:
                - 80
                - default_server
              - access_log: 'off'
              - server_tokens: 'off'
              - location /:
                - proxy_pass: http://webservers
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

            - server:
              - server_name: _
              - listen:
                - 443
                - ssl
                - default_server
              - access_log: 'off'
              - server_tokens: 'off'
              - ssl_certificate: /etc/ssl/certs/webmail.undergrid.net.crt
              - ssl_certificate_key: /etc/ssl/private/webmail.undergrid.net.key
              - ssl_trusted_certificate: /etc/ssl/certs/sub.class2.server.ca.crt
              - ssl_protocols:
                - TLSv1
                - TLSv1.1
                - TLSv1.2
              - ssl_prefer_server_ciphers: 'on'
              - ssl_dhparam: /etc/ssl/dhparams.pem
              - ssl_ciphers:
                - 'ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS'
              - ssl_stapling: 'on'
              - ssl_stapling_verify: 'on'
              - add_header:
                - Strict-Transport-Security 'max-age=31536000'
              - add_header:
                - Public-Key-Pins 'pin-sha256="8TVU99arhofm+qUMAt6c6FQZzhP9CUha1Uo5cCwrQa8="; pin-sha256="5SzpzAvKPcuCnphngHDKLm+DSF0saaDAFtpgOuTvhlQ="; max-age=315366000'
              - location /:
                - proxy_pass: http://webservers
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
