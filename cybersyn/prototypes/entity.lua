--By Mami
combinator_entity = flib.copy_prototype(data.raw["arithmetic-combinator"]["arithmetic-combinator"], COMBINATOR_NAME)
combinator_entity.icon = "__cybersyn__/graphics/icons/cybernetic-combinator.png"
combinator_entity.radius_visualisation_specification = {
	sprite = {
		filename = "__cybersyn__/graphics/icons/area-of-effect.png",
		tint = {r = 0.4, g = 1.0, b = 0.2, a = 0.4},
		height = 64,
		width = 64,
	},
	distance = 2.5,
}
combinator_entity.collision_box = {{-0.35, -0.35}, {0.35, 0.35}}
combinator_entity.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
combinator_entity.energy_source = { type = "void" }
combinator_entity.input_connection_bounding_box = {{-0.5, -0.49}, {0.5, 0.5}}
combinator_entity.output_connection_bounding_box = {{0.0, -0.01}, {0.0, -0.01}}
combinator_entity.flags = { "placeable-neutral", "player-creation", "hide-alt-info" }

if mods["nullius"] then
	combinator_entity.localised_name = { "entity-name.cybersyn-combinator" }
end

combinator_entity.sprites = make_4way_animation_from_spritesheet({ layers = {
	{
		filename = "__cybersyn__/graphics/combinator/cybernetic-combinator.png",
		width = 58,
		height = 52,
		frame_count = 1,
		shift = util.by_pixel(0, 5),
		hr_version = {
			scale = 0.5,
			filename = "__cybersyn__/graphics/combinator/hr-cybernetic-combinator.png",
			width = 114,
			height = 102,
			frame_count = 1,
			shift = util.by_pixel(0, 5)
		}
	},
	{
		filename = "__cybersyn__/graphics/combinator/cybernetic-combinator-shadow.png",
		width = 50,
		height = 34,
		frame_count = 1,
		shift = util.by_pixel(9, 6),
		draw_as_shadow = true,
		hr_version = {
			scale = 0.5,
			filename = "__cybersyn__/graphics/combinator/hr-cybernetic-combinator-shadow.png",
			width = 98,
			height = 66,
			frame_count = 1,
			shift = util.by_pixel(8.5, 5.5),
			draw_as_shadow = true
		}
	}
}})

local function create_combinator_display_direction(x, y, shift)
	return {
		filename="__cybersyn__/graphics/combinator/cybernetic-displays.png",
		x=x, y=y,
		width=15, height=11,
		shift=shift,
		draw_as_glow=true,
		hr_version={
			scale=0.5,
			filename="__cybersyn__/graphics/combinator/hr-cybernetic-displays.png",
			x=2*x, y=2*y,
			width=30, height=22,
			shift=shift,
			draw_as_glow=true
		}
	}
end
local function create_combinator_display(x, y)
	return {
		north=create_combinator_display_direction(x, y, util.by_pixel(0, -5)),
		east=create_combinator_display_direction(x, y, util.by_pixel(0, -5)),
		south=create_combinator_display_direction(x, y, util.by_pixel(0, -5)),
		west=create_combinator_display_direction(x, y, util.by_pixel(0, -5))
	}
end
combinator_entity.multiply_symbol_sprites = create_combinator_display(0, 0)
combinator_entity.divide_symbol_sprites = create_combinator_display(15, 0)
combinator_entity.plus_symbol_sprites = create_combinator_display(30, 0)
combinator_entity.minus_symbol_sprites = create_combinator_display(45, 0)
combinator_entity.modulo_symbol_sprites = create_combinator_display(0, 11)
combinator_entity.power_symbol_sprites = create_combinator_display(15, 11)
combinator_entity.left_shift_symbol_sprites = create_combinator_display(30, 11)
combinator_entity.right_shift_symbol_sprites = create_combinator_display(45, 11)
combinator_entity.and_symbol_sprites = create_combinator_display(0, 22)
combinator_entity.or_symbol_sprites = create_combinator_display(15, 22)
combinator_entity.xor_symbol_sprites = create_combinator_display(30, 22)

combinator_entity.input_connection_points = data.raw["constant-combinator"]["constant-combinator"].circuit_wire_connection_points
combinator_entity.output_connection_points = combinator_entity.input_connection_points

combinator_out_entity = flib.copy_prototype(data.raw["constant-combinator"]["constant-combinator"], COMBINATOR_OUT_NAME)
combinator_out_entity.icon = nil
combinator_out_entity.icon_size = nil
combinator_out_entity.icon_mipmaps = nil
combinator_out_entity.next_upgrade = nil
combinator_out_entity.minable = nil
combinator_out_entity.selection_box = nil
combinator_out_entity.collision_box = nil
combinator_out_entity.collision_mask = {}
combinator_out_entity.item_slot_count = 500
combinator_out_entity.circuit_wire_max_distance = 3
combinator_out_entity.flags = {"not-blueprintable", "not-deconstructable", "placeable-off-grid"}

local origin = {0.0, 0.0}
local invisible_sprite = {filename = "__cybersyn__/graphics/invisible.png", width = 1, height = 1}
local wire_con1 = {
	red = origin,
	green = origin
}
local wire_con0 = {wire = wire_con1, shadow = wire_con1}
combinator_out_entity.sprites = invisible_sprite
combinator_out_entity.activity_led_sprites = invisible_sprite
combinator_out_entity.activity_led_light = {
	intensity = 0,
	size = 0,
}
combinator_out_entity.activity_led_light_offsets = {origin, origin, origin, origin}
combinator_out_entity.draw_circuit_wires = false
combinator_out_entity.circuit_wire_connection_points = {
	wire_con0,
	wire_con0,
	wire_con0,
	wire_con0
}
