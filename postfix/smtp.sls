postfix:
  config:
    inet_interfaces: all
    relayhost: smtp.undergrid.net
    smtpd_sasl_auth_enable: 'yes'
    smtpd_sasl_authenticated_header: 'yes'
    smtpd_sasl_local_domain:
    smtpd_sasl_path: private/auth
    smtpd_sasl_security_options: noanonymous
    smtpd_sasl_type: dovecot
    virtual_alias_maps: proxy:pgsql:/etc/postfix/pgsql_virtual_alias_maps.cf, proxy:pgsql:/etc/postfix/pgsql_virtual_alias_domainaliases_maps.cf
    virtual_gid_maps: static:8
    virtual_mailbox_domains: proxy:pgsql:/etc/postfix/pgsql_virtual_domains_maps.cf
    virtual_mailbox_maps: proxy:pgsql:/etc/postfix/pgsql_virtual_mailbox_maps.cf, proxy:pgsql:/etc/postfix/pgsql_virtual_mailbox_domainaliases_maps.cf
    virtual_transport: lmtp:unix:private/dovecot-lmtp
    virtual_uid_maps: static:150

  master_config:
    enable_submission: True

fail2ban:
  lookup:
    jails:
      postfix:
        enabled: True
