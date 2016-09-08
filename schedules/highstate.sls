schedule:
  highstate_update:
    enabled: True
    function: state.highstate
    hours: 6
    splay: 300
    kwargs:
      test: False
    returner: slack
    return_job: True
