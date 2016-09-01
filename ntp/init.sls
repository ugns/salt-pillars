ntp:
  ng:
    settings:
      ntpd: True
      ntp_conf:
        server:
          - 'ntp01.undergrid.net iburst'
          - 'ntp02.undergrid.net iburst'
        restrict:
          - 'default ignore'
          - '-6 default ignore'
          - '127.0.0.1'
          - '-6 ::1'
          - 'ntp01.undergrid.net nomodify notrap nopeer noquery'
          - 'ntp02.undergrid.net nomodify notrap nopeer noquery'
        driftfile:
          - /var/lib/ntp/ntp.drift
