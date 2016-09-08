#!yaml|gpg
speedcomplainer:
  config:
    twitter:
      token: 4893964601-bcxe9F2M3ZkJsc9kdrzA0jTeQBtSR5Kw99t7qr5
      token_secret: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v2

        hQEMA3daYIEwiMseAQgAsNmpPPYIFSMHWUJGv6KuQ2sfBZBXXVp99N8iIQL+povM
        pz8pFhKnkKbKyCCvsiiOV93+xMYCW7S+SbEyP4hn6qhsB8J6HLQwNQu1UYSJpI/S
        dUCr8LoukEJdNGfEtdcsOudiD3qWOWETdGo2icX9FrU0NW5uY1R5svA4NORNYaEp
        j/wK2eAj1Ku6Xw5OxjYfK6xk7cMEUYJnXZOEb6nvpFw8n50WBzc6Dm/84rSJbQWz
        maAfjIVGzWIt5hn3uaIMm/WktTF8hbY06knTVjLKPZfs96CEScm0S+WpIUJ7hxPc
        RjREn9lf5OXv2vS82hMMReUXkaeufaTt5TZLKDkO/dJoAY5lhWfoNYGuwj5ctqjy
        hPCOUfK8J41KOt7wo04+Ld10WwZ6tQ89RzZioMHeBO2B49F42RZX066n64o1x5a0
        97SGqeEC1t45+qc0Ggj5sjCXCsMIqXr6IXGoBjj9eIhQFcdWC/G5k1A=
        =UKsh
        -----END PGP MESSAGE-----
      consumer_key: FaFtM1pOFhxDsx3sgXhKLuQ13
      consumer_secret: |
        -----BEGIN PGP MESSAGE-----
        Version: GnuPG v2

        hQEMA3daYIEwiMseAQgArS46iufWDfdQ34LEgJNIRvTmsSFMDVBqzwKLGezWnFid
        +g1f0XveBqOjZY9ahj9o51uM1HcpEBU0r2abUvm2oLF+z8u3GQlHZ59AdtqUTgef
        4DNlIeRnIqC2kDl4wCOiuiSmAQ4iGiYQjKZyPFXSgQswaCL1vGT3gUvxLFgTWiiN
        sa5Y+ChKmr2ub28DQYLJ/JfOmY0oQkMt7cmnViVA2n4vTuhDY+3wnm91XZrJzVWo
        0Ck4YETeQzHBqvgEd2QljTv+Ih4rlix0RNzxrVj4cZeeU69OhPJ2UAoaKBDnysrM
        AnDgbNQpWyX4lI8Ic/EmYjsu62VAPgEnY0P3gJKV8NJtAbEMw5Ibwbsj7ro9mDwF
        xXGD8cd4q40ESIFcbky8vF1B6WGLp3cnPAJz4+a/kUm9s7K1futBABfwqjVRpRVL
        a5/nVmQwqqHnk4giqqHUyTOM9XjTqaGgNaBfak6X15K4uLb8hbWAZSRdV9Bt9w==
        =Dr6T
        -----END PGP MESSAGE-----
    tweet_to: '@Comcast'
    tweetThresholds:
      5:
        - Hey {tweetTo} I'm paying for {internetSpeed}Mb/s but getting only {downloadResult} Mb/s?!? Shame.
        - Oi! {tweetTo} $100+/month for {internetSpeed}Mbit/s and I only get {downloadResult} Mbit/s? How does that seem fair?
      12.5:
        - Uhh {tweetTo} for $100+/month I expect better than {downloadResult}Mbit/s when I'm paying for {internetSpeed}Mbit/s. Fix your network!
        - Hey {tweetTo} why am I only getting {downloadResult}Mb/s when I pay for {internetSpeed}Mb/s? $100+/month for this??
      25:
        - Well {tweetTo} I guess {downloadResult}Mb/s is better than nothing, still not worth $100/mnth when I expect {internetSpeed}Mb/s

base:
  pkgs:
    - vim
    - tmux
    - git
    - virtualenv
