ntp:
  ng:
    settings:
      ntpd: True
      ntp_conf:
        pool:
          - 'us.pool.ntp.org iburst minpoll 6'
        server:
          - 'ntp01.undergrid.net iburst prefer'
        restrict:
          - 'source limited kod notrap nomodify nopeer noquery'
          - '127.0.0.1'
          - '-6 ::1'
        driftfile:
          - /var/lib/ntp/ntp.drift
        leapfile:
          - /var/lib/ntp/leap-seconds.file
        statsdir:
          - /var/log/ntpstats
        statistics:
          - loopstats peerstats clockstats sysstats
        filegen:
          - loopstats file loopstats type day enable
          - peerstats file peerstats type day enable
          - clockstats file clockstats type day enable
          - sysstats file sysstats type day enable
