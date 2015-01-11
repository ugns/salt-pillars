#!yaml|gpg
duo:
  config:
    ikey: DISJGI2G4MBZ1E58LW41
    skey: |
      -----BEGIN PGP MESSAGE-----
      Version: GnuPG v2

      hQEMA3daYIEwiMseAQf/QJqWPAAB3eZw7nkaDvvji8oB51CgCUYfiouQGxnASf2v
      tJ6US8U0bLiFbvrVvSUhb1Ylc8+HoLhxikFYKYya/JHIBnrDcWDG+rs/T9PykKXx
      AlMpQ5BJySMumoKIidtM1hwcKbvP4tduCDWmY+vV5nAQwxZP1UOW2PHDR4ajM713
      WIdNshOvB7RKQ2BPWuD98hYgDTNLg5SWCc3bxWCsKtFfxvbxV4B+aRVz7RB3tJrC
      qXmIskh6fSUAHKFyNEvPvQf/KqQlS6BzIZAJEpCxbCwF5pjRXm5Rt1DsdMzYmXcq
      54yiiXMWawu9wr3kOxSzKDqXr4OyqP8r0aahQxW8sdJjAUe2V2nm8AKXMYqLP5vm
      pXJDDB0EOU6O8sCT6MWegXOaOsQit3PN2oUiN6mYtabeSU7udZfrtAk1IRXpSaxb
      UawhfimiHtNHdeQ/YXJNYz4BJxha4HkFdn1o5cQtjM4aI3/e
      =N7Vv
      -----END PGP MESSAGE-----
    host: api-51e3b241.duosecurity.com
    pushinfo: True
    autopush: True
    prompts: 1

sshd_config:
  ForceCommand: /usr/sbin/login_duo
  PermitTunnel: False
  AllowTcpForwarding: False
  UseDNS: False
