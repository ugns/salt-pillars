postfix:
  config:
    inet_interfaces: localhost
    relayhost: smtp.undergrid.net
    smtpd_banner: $myhostname ESMTP
    default_process_limit: 100
    smtpd_client_connection_count_limit: 10
    smtpd_client_connection_rate_limit: 30
    queue_minfree: 20971520
    header_size_limit: 51200
    message_size_limit: 10485760
    smtpd_recipient_limit: 100
    mydestination: {{ grains['fqdn'] }}, localhost.localdomain
    mynetworks_style: host
    smtpd_relay_restrictions:
    smtpd_recipient_restrictions: permit_mynetworks, permit_sasl_authenticated, reject_unauth_pipelining, reject_non_fqdn_recipient, reject_unknown_recipient_domain, reject_unauth_destination, permit
