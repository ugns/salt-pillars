#!yaml|gpg
salt:
  engines:
    slack:
      token: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v2

        hQEMA3daYIEwiMseAQf/ep5eFsCHuqFy6tGljIB4FICnkJ6xlJw1xX77wLh935JD
        chxlWkvg1yCCxXSe+tzNmMwtGDHeoo/0CzQCo9xjiImGt/Wg0VIT6sBRVG3z1Ktt
        NUtGC8idR7K4j91Uh7GMAu7Qtm5CQOdy7EiPPxRrXq7V/27onvaDDF7pCNmk3BgF
        LZtfNl/4BND7OElvkMs4avk7tBDEdSfbLoU3pojdNuhTqJPzfwngvoP9amvrc+2o
        uR6745cnk7rXfHYOVNJdMaB7BLudZ79cUjNdX77DMFiiGE57GL8pgDbnHmpra7ld
        BuM+8z3AWS+n+rnYAMNKAVFk2nZ0M45oX68UPbRoY9JkAe2ei0yo+3sCyChfLgTs
        gpdgtF89j8Shnv5003loMjTkL2BNzBLGKOwnSSAWs14PUaBzkpKPRATrxdev0hA7
        Rax+F+CRmqMC+ywDg9DpbcZNJKyr94xL+QEc0HmRrTQSzuz2pg==
        =qnPE
        -----END PGP MESSAGE-----
      control: True
      valid_users:
        - jbouse
      valid_commands:
        - test.ping
        - list_jobs
        - active_jobs
        - refresh_pillars
        - schedules
      aliases:
        list_jobs:
          type: runner
          cmd: jobs.list_jobs
        active_jobs:
          type: runner
          cmd: jobs.active
        refresh_pillars:
          cmd: saltutil.refresh_pillar
        schedules:
          cmd: schedule.list
