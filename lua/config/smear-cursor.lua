local opts = {
  stiffness = 0.3,
  trailing_stiffness = 0.4,
  distance_stop_animating = 0.9,
  never_draw_over_target = false,
}

require("smear_cursor").setup(opts)
