schedule:
  highstate_update:
    enabled: True
    function: state.highstate
    hours: 6
    splay: 300
    kwargs:
      test: False
    returner: slack
    run_on_start: False
    return_job: True
