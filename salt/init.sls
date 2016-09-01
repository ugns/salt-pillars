#!jinja|yaml|gpg
salt:
  clean_config_d_dir: False

  minion:
    master: salt.{{ grains.domain }}
    module_config:
      test: True

  returners:
    hipchat:
      api_key: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v2

        hQEMA3daYIEwiMseAQf9GEAV5qYxm5FkufxRMYnDdp+vaKEYtA+sCADMT2zhO8ea
        yA1bdCjIAp3eubZZSMdbHYJHFWYCC67LAtlAXylL+fv6bfEMiKvjJX+OFekjqKIX
        Ct0fWShOwImY71UCgIn3J5I2dVj60Gb3Cy/aF2WKqmmnDAeMbXKCVKDj+o32FR9t
        9iW+V075XMSRCs/qxGZy/RRtXd8Wb/baiLEEFyhkuDDICfPafuVFaocHB31r8MLs
        7v9cBAJHpO+88l/QLyv6ugM34X0V1IUBNhel0bd3wvZszlsHKYaQExWEnj07uEuS
        oGsTVuxyABII/pgcgTv89JHP4Y/kBHa2BD/CMAuwONJjAWpXZbOkwSZ7qT7++anI
        P1UYraLRfrx94wa8feBoMb8qxZlOALhPDXcai4YAivfigV1wB+lzIZrxR3Pc0fx5
        612OWIizOt4keBi0cNZs9j2YDmxyIzQ9cgGfFihc4d3y0PRE
        =K2Bm
        -----END PGP MESSAGE-----
      api_version: v2
      from_name: SaltStack
      room_id: 2017489
      notify: True
      color: random

    slack:
      api_key: |
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
      username: saltstack
      as_user: True
      channel: 'automation'
      yaml_format: True
      changes: True
