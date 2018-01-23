data:extend({
   {
      type = "selection-tool",
      name = "yastool",
      icon = "__yastool__/graphics/selection_tool.png",
      icon_size = 32,
      subgroup = "tool",
      order = "e[utility]-a[yastool]",
      stack_size = 1,
      stackable = false,
      flags = {"goes-to-quickbar"},
      selection_color = {r = 0, g = 0, b = 0},
      alt_selection_color = {r = 1, g = 1, b = 1},
      selection_mode = {"tiles"},
      alt_selection_mode = {"tiles"},
      selection_cursor_box_type = "entity",
      alt_selection_cursor_box_type = "entity"
   }, {
      type = "recipe",
      name = "yastool",
      ingredients = {},
      result = "yastool",
      enabled = true
   }
})
