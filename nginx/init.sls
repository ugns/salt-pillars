nginx:
  ng:
    server:
      config:
        http:
          ssl_session_cache: shared:SSL:20m
          ssl_session_timeout: 10m
          ssl_protocols: TLSv1 TLSv1.1 TLSv1.2
          ssl_prefer_server_ciphers: 'on'
          gzip: 'on'

    vhosts:
      managed:
        default:
          enabled: False
          config:
