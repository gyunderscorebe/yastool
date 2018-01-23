data:extend({
   {
      type = "bool-setting",
      name = "yastool_normal_snap_to_grid",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "1-1"
   }, {
      type = "int-setting",
      name = "yastool_normal_resolution_limit",
      setting_type = "runtime-per-user",
      minimum_value = 1,
      maximum_value = 16384,
      default_value = 4096,
      order = "1-2"
   }, {
      type = "int-setting",
      name = "yastool_normal_pixels_per_tile_limit",
      setting_type = "runtime-per-user",
      minimum_value = 1,
      maximum_value = 16384,
      default_value = 64,
      order = "1-3"
   }, {
      type = "bool-setting",
      name = "yastool_normal_show_gui",
      setting_type = "runtime-per-user",
      default_value = false,
      order = "1-4"
   }, {
      type = "bool-setting",
      name = "yastool_normal_show_entity_info",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "1-5"
   }, {
      type = "bool-setting",
      name = "yastool_normal_anti_alias",
      setting_type = "runtime-per-user",
      default_value = false,
      order = "1-6"
   }, {
      type = "string-setting",
      name = "yastool_normal_path",
      setting_type = "runtime-per-user",
      default_value = "normal_screenshot_{tick}.png",
      order = "1-7"
   }, {
      type = "bool-setting",
      name = "yastool_alt_snap_to_grid",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "2-1"
   }, {
      type = "int-setting",
      name = "yastool_alt_resolution_limit",
      setting_type = "runtime-per-user",
      minimum_value = 1,
      maximum_value = 16384,
      default_value = 2048,
      order = "2-2"
   }, {
      type = "int-setting",
      name = "yastool_alt_pixels_per_tile_limit",
      setting_type = "runtime-per-user",
      minimum_value = 1,
      maximum_value = 16384,
      default_value = 128,
      order = "2-3"
   }, {
      type = "bool-setting",
      name = "yastool_alt_show_gui",
      setting_type = "runtime-per-user",
      default_value = false,
      order = "2-4"
   }, {
      type = "bool-setting",
      name = "yastool_alt_show_entity_info",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "2-5"
   }, {
      type = "bool-setting",
      name = "yastool_alt_anti_alias",
      setting_type = "runtime-per-user",
      default_value = true,
      order = "2-6"
   }, {
      type = "string-setting",
      name = "yastool_alt_path",
      setting_type = "runtime-per-user",
      default_value = "alt_screenshot_{tick}.png",
      order = "2-7"
   }
})
