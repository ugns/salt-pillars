apache:
  modules:
    enabled:
      - alias
      - autoindex
      - dir
      - env
      - mime
      - negotiation
      - setenvif
      - auth_basic
      - deflate
      - authz_user
      - authz_groupfile
      - authn_file
      - authz_host
      - reqtimeout
      - rewrite
      - expires
      - headers
    disabled:
      - status
