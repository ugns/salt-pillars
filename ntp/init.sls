ntp:
  ng:
    settings:
      ntpd: True
      ntp_conf:
        server:
          - 'navops1.gatech.edu iburst'
          - 'ntp3.mattnordhoff.net iburst'
          - 'ntp01.undergrid.net iburst prefer'
        restrict:
          - 'default ignore'
          - '-6 default ignore'
          - '127.0.0.1'
          - '-6 ::1'
          {# navobs1.gatech.edu #}
          - 'navobs1.gatech.edu nomodify notrap nopeer noquery'
          {# ntp3.mattnordhoff.net #}
          - 'ntp3.mattnordhoff.net nomodify notrap nopeer noquery'
          - '-6 ntp3.mattnordhoff.net nomodify notrap nopeer noquery'
          {# ntp01.undergrid.net #}
          - 'ntp01.undergrid.net nomodify notrap nopeer noquery'
        driftfile:
          - /var/lib/ntp/ntp.drift
