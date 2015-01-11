nginx:
  ng:
    vhosts:
      managed:
        webmail:
          enabled: True
          config:
            - upstream roundcube:
              - server: web01.atl.undergrid:80

            - upstream postfixadmin:
              - server: web02.atl.undergrid:80

            - server:
              - server_name:
                - webmail.*
                - mail.*
                - imap.*
              - listen:
                - 80
              - access_log: 'off'
              - server_tokens: 'off'
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
