ntp:
  ng:
    settings:
      ntpd: True
      ntp_conf:
        pool:
          - 'us.pool.ntp.org iburst minpoll 6 prefer'
        server:
          {## GPS_NEMA(0) 19200 baud, GPGGA sentences  ##}
          - '127.127.20.0 mode 34 minpoll 3 prefer'
        fudge:
          {## Enable PPS, Obscure location, offset calibration factor ##}
          - '127.127.20.0 refid GPS flag1 1 flag4 1 time2 0.534'
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

ntp-stats:
  host: ntp01
  log_dir: /var/log/ntpstats/
  www_location: web03:/srv/ntp-stats/images/

raspberrypi:
  config:
    dtoverlay: pps-gpio,gpiopin=4
    init_uart_baud: 19200
