local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
  position = "bottom",
  height = 40,
  color = colors.bar.bg,
  padding_right = 2,
  padding_left = 2,
  blur_radius = 20,
  topmost = "window"
})