postfix:
  config:
    inet_interfaces: all
    myhostname: smtp.undergrid.net
    mynetworks: '127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128 96.80.33.144/29'
    mydestination: {{ grains.fqdn }}, smtp.undergrid.net, localhost, localhost.localdomain
    relayhost: ''
    masquerade_classes: envelope_sender, envelope_recipient, header_sender, header_recipient
    masquerade_domains: undergrid.net undergrid.com
    content_filter: amavis:[10.132.50.5]:10024
    disable_vrfy_command: 'yes'
    header_checks: regexp:/etc/postfix/header_checks
    smtp_header_checks: regexp:/etc/postfix/header_checks
    maximal_backoff_time: 8000s
    maximal_queue_lifetime: 7d
    message_size_limit: 10485760
    minimal_backoff_time: 1000s
    sender_bcc_maps: hash:/etc/postfix/archive_mappings
    recipient_bcc_maps: hash:/etc/postfix/archive_mappings
    smtp_helo_timeout: 60s
    smtp_tls_CAfile: /etc/ssl/certs/ca-certificates.crt
    smtp_tls_exclude_ciphers: aNULL
    smtp_tls_mandatory_exclude_ciphers: RC4, MD5
    smtp_tls_mandatory_protocols: '!SSLv2, !SSLv3'
    smtp_tls_note_starttls_offer: 'yes'
    smtp_tls_protocols: '!SSLv2, !SSLv3'
    smtp_tls_security_level: may
    smtpd_client_restrictions: permit_mynetworks, permit_sasl_authenticated, reject_rbl_client zen.spamhaus.org, reject_rbl_client bl.spamcop.net, reject_rbl_client bogons.cymru.com
    smtpd_data_restrictions: reject_unauth_pipelining
    smtpd_delay_reject: 'yes'
    smtpd_hard_error_limit: 12
    smtpd_helo_required: 'yes'
    smtpd_helo_restrictions: permit_mynetworks, reject_non_fqdn_helo_hostname, reject_invalid_helo_hostname
    smtpd_recipient_restrictions: reject_non_fqdn_sender, reject_unknown_sender_domain, reject_non_fqdn_recipient, reject_unknown_recipient_domain,  permit_mynetworks, permit_sasl_authenticated, reject_unauth_pipelining, reject_unauth_destination, reject_invalid_helo_hostname, reject_non_fqdn_helo_hostname, reject_rbl_client zen.spamhaus.org, reject_rbl_client bl.spamcop.net, reject_rbl_client bogons.cymru.com, check_policy_service unix:private/policyd-spf
    smtpd_sasl_auth_enable: 'yes'
    smtpd_sasl_authenticated_header: 'yes'
    smtpd_sasl_local_domain: ''
    smtpd_sasl_path: inet:mail.undergrid.net:54321
    smtpd_sasl_security_options: noanonymous
    smtpd_sasl_type: dovecot
    smtpd_sender_restrictions: reject_non_fqdn_sender, reject_unknown_sender_domain, check_client_access cidr:/etc/postfix/drop.cidr, check_sender_ns_access cidr:/etc/postfix/drop.cidr, check_sender_mx_access cidr:/etc/postfix/drop.cidr, reject_rbl_client bogons.cymru.com, check_sender_access pcre:/etc/postfix/sender_access, permit_sasl_authenticated, permit_mynetworks
    smtpd_soft_error_limit: 3
    smtpd_tls_CAfile: /etc/ssl/certs/ca-certificates.crt
    smtpd_tls_auth_only: 'yes'
    smtpd_tls_cert_file: /etc/letsencrypt/live/smtp.undergrid.net/fullchain.pem
    smtpd_tls_dh1024_param_file: ${config_directory}/dhparams.pem
    smtpd_tls_exclude_ciphers: aNULL, eNULL, EXPORT, DES, RC4, MD5, PSK, aECDH, EDH-DSS-DES-CBC3-SHA, EDH-RSA-DES-CDC3-SHA, KRB5-DE5, CBC3-SHA
    smtpd_tls_key_file: /etc/letsencrypt/live/smtp.undergrid.net/privkey.pem
    smtpd_tls_mandatory_protocols: '!SSLv2, !SSLv3'
    smtpd_tls_security_level: may
    smtpd_tls_received_header: 'yes'
    smtpd_tls_session_cache_timeout: 3600s
    strict_rfc821_envelopes: 'yes'
    policyd-spf_time_limit: 3600s
    smtpd_use_tls: 'yes'
    tls_random_source: dev:/dev/urandom
    unknown_local_recipient_reject_code: 450
    unknown_address_reject_code: 554
    unknown_hostname_reject_code: 554
    unknown_client_reject_code: 550
    unverified_sender_reject_code: 554
    virtual_alias_maps: proxy:pgsql:/etc/postfix/pgsql_virtual_alias_maps.cf, proxy:pgsql:/etc/postfix/pgsql_virtual_alias_domainaliases_maps.cf
    virtual_gid_maps: static:8
    virtual_mailbox_domains: proxy:pgsql:/etc/postfix/pgsql_virtual_domains_maps.cf
    virtual_mailbox_maps: proxy:pgsql:/etc/postfix/pgsql_virtual_mailbox_maps.cf, proxy:pgsql:/etc/postfix/pgsql_virtual_mailbox_domainaliases_maps.cf
    virtual_transport: lmtp:inet:mail.undergrid.net:24
    virtual_uid_maps: static:150
    receive_override_options: no_address_mappings

  amavis:
    enabled: True

  policyd-spf:
    enabled: True

  master_config:
    enable_submission: True
    amavis_return: {{ grains.ip4_interfaces['eth1'][0] }}:10025
    amavis_networks: 10.132.50.0/24

fail2ban:
  lookup:
    jails:
      postfix:
        enabled: True

mine_interval: 5
mine_functions:
  external_ip_addrs:
    mine_function: network.ip_addrs
    interface: eth0
  internal_ip_addrs:
    mine_function: network.ip_addrs
    interface: eth1
