local function get_options(player, is_alt)
   local player_settings = settings.get_player_settings(player)
   local prefix = "yastool_" .. (is_alt and "alt_" or "normal_")

   local options = {}

   for _, option_name in ipairs({
      "snap_to_grid", "resolution_limit", "pixels_per_tile_limit", "show_gui", "show_entity_info", "anti_alias", "path"
   }) do
      options[option_name] = player_settings[prefix .. option_name].value
   end

   return options
end

local function normalize_coordinate(options, value)
   if options.snap_to_grid then
      return math.floor(value + 0.5)
   else
      return value
   end
end

local function on_selection(event)
   if event.item ~= "yastool" then
      return
   end

   local player = game.players[event.player_index]
   local is_alt = event.name == defines.events.on_player_alt_selected_area
   local options = get_options(player, is_alt)

   local left_top_x = normalize_coordinate(options, event.area.left_top.x)
   local left_top_y = normalize_coordinate(options, event.area.left_top.y)
   local right_bottom_x = normalize_coordinate(options, event.area.right_bottom.x)
   local right_bottom_y = normalize_coordinate(options, event.area.right_bottom.y)

   local center_x = (left_top_x + right_bottom_x) / 2
   local center_y = (left_top_y + right_bottom_y) / 2

   local tile_width = right_bottom_x - left_top_x
   local tile_height = right_bottom_y - left_top_y

   -- Figure out resolution (image size in pixels).
   -- It has to be a multiple of area size in tiles.
   -- The higher the multiplier, the higher the quality of the resulting image.
   -- However, there should be some limits.
   -- Resolution shouldn't be higher than some limit (e.g. 4096) in each dimension.
   -- The multiplier itself shouldn't be too high either - doesn't make sense
   -- to make 4096x4096 screenshot of a single tile.
   -- First, try pinning resolution for the longer dimension of the area to maximum allowed value.
   -- If the multiplier is too large, set it to its limit.

   local max_tile_size = math.max(tile_width, tile_height)
   local pixels_per_tile = options.resolution_limit / max_tile_size

   if pixels_per_tile > options.pixels_per_tile_limit then
      pixels_per_tile = options.pixels_per_tile_limit
   end

   local pixel_width = math.floor(tile_width * pixels_per_tile)
   local pixel_height = math.floor(tile_height * pixels_per_tile)

   if pixel_width < 1 or pixel_height < 1 then
      player.print(("Screenshot area is too small - calculated resolution is %dx%d, should be at least 1x1"):format(
         pixel_width, pixel_height))
      return
   end

   local size_limit = options.anti_alias and 8192 or 16384

   if pixel_width > size_limit or pixel_height > size_limit then
      player.print(("Screenshot area is too large - calculated resolution is %dx%d, should be at most %dx%d"):format(
         pixel_width, pixel_height, size_limit, size_limit))
      return
   end

   local zoom = pixels_per_tile / 32

   local path = options.path:gsub("{tick}", ("%d"):format(event.tick))

   player.print(("Saving a screenshot (%.10gx%.10g tiles, %dx%d pixels) to %s"):format(
      tile_width, tile_height, pixel_width, pixel_height, path))

   game.take_screenshot({
      player = player,
      by_player = player,
      position = {x = center_x, y = center_y},
      resolution = {x = pixel_width, y = pixel_height},
      zoom = zoom,
      show_gui = options.show_gui,
      show_entity_info = options.show_entity_info,
      anti_alias = options.anti_alias,
      path = path
   })
end

script.on_event({defines.events.on_player_selected_area, defines.events.on_player_alt_selected_area}, on_selection)
