local client_latency, client_log, client_draw_rectangle, client_draw_circle_outline, client_timestamp, client_userid_to_entindex, client_draw_indicator, client_draw_gradient, client_set_event_callback, client_screen_size, client_eye_position = client.latency, client.log, client.draw_rectangle, client.draw_circle_outline, client.timestamp, client.userid_to_entindex, client.draw_indicator, client.draw_gradient, client.set_event_callback, client.screen_size, client.eye_position 
local client_draw_circle, client_color_log, client_delay_call, client_draw_text, client_visible, client_exec, client_trace_line, client_set_cvar, client_world_to_screen = client.draw_circle, client.color_log, client.delay_call, client.draw_text, client.visible, client.exec, client.trace_line, client.set_cvar, client.world_to_screen 
local client_draw_hitboxes, client_get_cvar, client_draw_line, client_camera_angles, client_draw_debug_text, client_random_int, client_random_float = client.draw_hitboxes, client.get_cvar, client.draw_line, client.camera_angles, client.draw_debug_text, client.random_int, client.random_float 
local entity_get_local_player, entity_is_enemy, entity_hitbox_position, entity_get_player_name, entity_get_steam64, entity_get_bounding_box, entity_get_all, entity_set_prop = entity.get_local_player, entity.is_enemy, entity.hitbox_position, entity.get_player_name, entity.get_steam64, entity.get_bounding_box, entity.get_all, entity.set_prop 
local entity_is_alive, entity_get_player_weapon, entity_get_prop, entity_get_players, entity_get_classname = entity.is_alive, entity.get_player_weapon, entity.get_prop, entity.get_players, entity.get_classname 
local globals_realtime, globals_absoluteframetime, globals_tickcount, globals_curtime, globals_mapname, globals_tickinterval, globals_framecount, globals_frametime, globals_maxplayers = globals.realtime, globals.absoluteframetime, globals.tickcount, globals.curtime, globals.mapname, globals.tickinterval, globals.framecount, globals.frametime, globals.maxplayers 
local ui_new_slider, ui_new_combobox, ui_reference, ui_set_visible, ui_is_menu_open, ui_new_color_picker, ui_set_callback, ui_set, ui_new_checkbox, ui_new_hotkey, ui_new_button, ui_new_multiselect, ui_get = ui.new_slider, ui.new_combobox, ui.reference, ui.set_visible, ui.is_menu_open, ui.new_color_picker, ui.set_callback, ui.set, ui.new_checkbox, ui.new_hotkey, ui.new_button, ui.new_multiselect, ui.get 
local math_ceil, math_tan, math_log10, math_randomseed, math_cos, math_sinh, math_random, math_huge, math_pi, math_max, math_atan2, math_ldexp, math_floor, math_sqrt, math_deg, math_atan, math_fmod = math.ceil, math.tan, math.log10, math.randomseed, math.cos, math.sinh, math.random, math.huge, math.pi, math.max, math.atan2, math.ldexp, math.floor, math.sqrt, math.deg, math.atan, math.fmod 
local math_acos, math_pow, math_abs, math_min, math_sin, math_frexp, math_log, math_tanh, math_exp, math_modf, math_cosh, math_asin, math_rad = math.acos, math.pow, math.abs, math.min, math.sin, math.frexp, math.log, math.tanh, math.exp, math.modf, math.cosh, math.asin, math.rad 
local table_maxn, table_foreach, table_sort, table_remove, table_foreachi, table_move, table_getn, table_concat, table_insert = table.maxn, table.foreach, table.sort, table.remove, table.foreachi, table.move, table.getn, table.concat, table.insert 
local string_find, string_format, string_rep, string_gsub, string_len, string_gmatch, string_dump, string_match, string_reverse, string_byte, string_char, string_upper, string_lower, string_sub = string.find, string.format, string.rep, string.gsub, string.len, string.gmatch, string.dump, string.match, string.reverse, string.byte, string.char, string.upper, string.lower, string.sub 
local bit_band = bit.band
--end of local variables

local ui_enabledd = ui.new_checkbox("AA", "Anti-aimbot angles", "Enable Gonc Anti-Aim")
local freestanding_body_yaw = ui.reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
local label1 = ui.new_label("AA", "Anti-aimbot angles", "                   ")
local label2 = ui.new_label("AA", "Other", "                   ")
local label3 = ui.new_label("AA", "Anti-aimbot angles", "                    GoncAA V5")
local label4 = ui.new_label("AA", "Anti-aimbot angles", "        Gonc blesses you with p100")
local ui_desynctype = ui.new_combobox("AA", "Anti-aimbot angles", "                         Modes:", {"Off", "Gonc Jitter", "Gonc Prediction", "Gonc Yaw", "Schmitt", "Pratham Prediction", "Omen Gucman"})
local increase_speed_mode = ui.new_checkbox("AA", "Other","Dangerous double tap")
local limit = ui.reference( "AA", "Fake lag", "Limit" )





-- [x]===================[ Menu additions & References  ]===================[x] 


local new_check_box, new_multiselect, new_slider = ui.new_checkbox, ui.new_multiselect, ui.new_slider
local ui_get, ui_set, ui_ref = ui.get, ui.set, ui.reference
local ui_reference = ui.reference
local globals_curtime = globals.curtime
local ui_newslider = ui.new_slider
local new_combobox = ui.new_combobox
local ui_set_visible = ui.set_visible
local client_log = client.log
local renderer_text = renderer.text
local client_screen_size = client.screen_size
local client_set_event_callback = client.set_event_callback
local globals_realtime = globals.realtime
local math_floor = math.floor
local reference_pitch, reference_yaw_slider = ui_reference("AA", "Anti-aimbot angles", "Pitch")
local attarget = ui_reference("AA", "Anti-aimbot angles", "Yaw base")
local reference_yaw, reference_yaw_slider = ui_reference("AA", "Anti-aimbot angles", "Yaw")
local reference_body, reference_body_slider = ui_reference("AA", "Anti-aimbot angles", "Body yaw")
local reference_yaw_jitter_type, reference_yaw_jit_slider = ui_reference("AA", "Anti-aimbot angles", "Yaw jitter")
local reference_body_target = ui_reference("AA", "Anti-aimbot angles", "Lower Body yaw target")
local reference_body_yaw_limit = ui_reference("AA", "Anti-aimbot angles", "Fake yaw limit")
local freestand = ui_reference("AA", "Anti-aimbot angles", "Freestanding body yaw")
local edge_yaw = ui_reference("AA", "Anti-aimbot angles", "Edge yaw")
local freestanddrop = ui_reference("AA", "Anti-aimbot angles", "Freestanding")
client.exec("clear")
client.exec("exec gonc")
local noticetheaa = ui.new_label("AA", "Anti-aimbot angles", " ")


local maintain = ui.new_combobox( "AA", "Anti-aimbot angles", "LBY Movement", { "Off", "Fake twist", "Fake jitter", "Fake max"} )
local limit = ui.reference( "AA", "Fake lag", "Limit" )



local updates = 0
local targeted = 0
client.set_event_callback( "setup_command", function( cmd )	
	if cmd.chokedcommands == 0 then
		updates = updates + 1
		targeted = targeted + 1
	end
		
	if targeted >= ui.get( limit ) then
		targeted = 0
	end
		
	if cmd.in_forward == 0 and cmd.in_back == 0 and cmd.in_moveleft == 0 and cmd.in_moveright == 0 then
		cmd.allow_send_packet = false
		if ui.get( maintain ) == "Fake twist" then 
			if ( cmd.chokedcommands % ( updates % 2 == 0 and ui.get( limit ) / 2 or 0 ) == 0 ) then
				cmd.forwardmove = 1.01
			end
		elseif ui.get( maintain ) == "Fake jitter" then 
			if cmd.chokedcommands % 2 ~= 0 and cmd.chokedcommands % targeted == 0 then
				cmd.forwardmove = 1.01
			end
		elseif ui.get( maintain ) == "Fake max" then 
			if cmd.chokedcommands % targeted then
				cmd.forwardmove = 1.01
			end
		end
	end
end )














-- [x]======================================================================[x] 
---BROKEN
	local legit_e_key = ui.new_checkbox("AA", "Anti-aimbot angles", "Legit AA on E")
	--if ui.get(forwardsting) then
	-- ui_set(reference_yaw, "Off")
	-- else
	--ui_set(reference_yaw, "180")
	--end 
-- [x]======================================================================[x] 





client.set_event_callback("setup_command",function(e)
    local weaponn = entity.get_player_weapon()
    if ui.get(legit_e_key) then
        if weaponn ~= nil and entity.get_classname(weaponn) == "CC4" then
            if e.in_attack == 1 then
                e.in_attack = 0 
                e.in_use = 1
            end
        else
            if e.chokedcommands == 0 then
                e.in_use = 0
            end
        end
end
end)

-- [x]===================[ Multiselect options  ]===================[x] 

local function set()
    if ui_get(ui_desynctype) == "Off" then
      return
    end


    if ui_get(ui_desynctype) == "Gonc Jitter" then
	   ui_set(reference_yaw, "180")
	   ui_set(reference_yaw_slider, 20)
	   ui_set(reference_yaw_jitter_type, "Offset")
       ui_set(reference_yaw_jit_slider, 4)
       ui_set(reference_body, "Opposite")
       ui_set(reference_body_yaw_limit, 38)
       ui.set(attarget, "At targets")
       ui.set_visible(attarget, false)
	   ui.set_visible(reference_body_yaw_limit, false)
	   ui.set_visible(reference_yaw_slider, false)
	   ui.set_visible(reference_body_slider, false)
	   ui.set_visible(reference_yaw_jit_slider, false)
	   ui.set_visible(freestand, false)
    end

    if ui_get(ui_desynctype) == "Gonc Prediction" then
	   ui_set(reference_yaw, "180")
	   ui_set(reference_yaw_slider, 5)
	   ui_set(reference_yaw_jitter_type, "Off")	  
       ui_set(reference_yaw_jit_slider, 0)	   
       ui_set(reference_body_target, "Opposite")
	   ui_set(reference_body, "Static")
	   ui_set(reference_body_slider, 36)
	   ui_set(reference_body_yaw_limit, 43)	 
       ui.set(attarget, "At targets")
       ui.set_visible(attarget, false) 
       ui.set_visible(reference_body_yaw_limit, false)	  
       ui.set_visible(reference_yaw_slider, false) 
	   ui.set_visible(reference_body_slider, false)
	   ui.set_visible(reference_yaw_jit_slider, false)
	   ui.set_visible(freestand, false)
    end

    if ui_get(ui_desynctype) == "Gonc Yaw" then
        ui_set(reference_yaw, "180")
        ui_set(reference_yaw_slider, 30)
        ui_set(reference_yaw_jitter_type, "Offset")
        ui_set(reference_yaw_jit_slider, -5)
        ui_set(reference_body_target, "Eye yaw")
	   ui_set(reference_body, "Static")
	   	   ui_set(reference_body_slider, 48)
        ui_set(reference_body_yaw_limit, 38)
        ui.set(attarget, "At targets")
        ui.set_visible(attarget, false)
        ui.set_visible(reference_body_yaw_limit, false)
        ui.set_visible(reference_yaw_slider, false)
        ui.set_visible(reference_body_slider, false)
        ui.set_visible(reference_yaw_jit_slider, false)
        ui.set_visible(freestand, false)
     end
    
     
     if ui_get(ui_desynctype) == "Schmitt" then
        ui_set(reference_yaw, "180")
        ui_set(reference_yaw_slider, 0)
        ui_set(reference_yaw_jitter_type, "Center")
        ui_set(reference_yaw_jit_slider, 32)
        ui_set(reference_body_target, "Sway")
        ui_set(reference_body, "Static")
		ui_set(reference_body_slider, -32)
        ui_set(reference_body_yaw_limit, 39)
        ui.set(attarget, "At targets")
        ui.set_visible(attarget, false)
        ui.set_visible(reference_body_yaw_limit, false)
        ui.set_visible(reference_yaw_slider, false)
        ui.set_visible(reference_body_slider, false)
        ui.set_visible(reference_yaw_jit_slider, false)
        ui.set_visible(freestand, false)
     end

     if ui_get(ui_desynctype) == "Pratham Prediction" then
        ui_set(reference_yaw, "180")
        ui_set(reference_yaw_slider, -2)
        ui_set(reference_yaw_jitter_type, "Random")
        ui_set(reference_yaw_jit_slider, -3)
        ui_set(reference_body_target, "Opposite")
        ui_set(reference_body, "Static")
        ui_set(reference_body_slider, 36)
        ui_set(reference_body_yaw_limit, 38)	
        ui.set(attarget, "At targets")
        ui.set_visible(attarget, false)
        ui.set_visible(reference_body_yaw_limit, false)
        ui.set_visible(reference_yaw_slider, false)
        ui.set_visible(reference_body_slider, false)
        ui.set_visible(reference_yaw_jit_slider, false)
        ui.set_visible(freestand, false)
     end
	 
	if ui_get(ui_desynctype) == "Omen Gucman" then
        ui_set(reference_yaw, "180")
        ui_set(reference_yaw_slider, 7)
        ui_set(reference_yaw_jitter_type, "Offset")
        ui_set(reference_yaw_jit_slider, -4)
        ui_set(reference_body_target, "Eye yaw")
        ui_set(reference_body, "Static")
        ui_set(reference_body_slider, 25)
        ui_set(reference_body_yaw_limit, 33)	
        ui.set(attarget, "At targets")
        ui.set_visible(attarget, false)
        ui.set_visible(reference_body_yaw_limit, false)
        ui.set_visible(reference_yaw_slider, false)
        ui.set_visible(reference_body_slider, false)
        ui.set_visible(reference_yaw_jit_slider, false)
        ui.set_visible(freestand, false)
    end

	
	
	
end
-- [x]==============================================================[x] 



-- [x]===================[ Hide elements if Goncaa isn't on, not sure how to make this better  ]===================[x] 
local function handle_menu()
if ui.get(ui_enabledd) then
ui.set_visible(maintain, true)
    ui.set_visible(label1, true)
	ui.set_visible(legit_e_key, true)
    ui.set_visible(label2, true)
	ui.set_visible(label3, true)
	ui.set_visible(label4, true)
    ui.set_visible(attarget, false)
	ui.set_visible(ui_desynctype, true)
	ui.set_visible(reference_pitch, false)
	ui.set_visible(reference_yaw, false)
	ui.set_visible(reference_yaw_slider, false)
	ui.set_visible(reference_body, false)
	ui.set_visible(reference_body_slider, false)
	ui.set_visible(reference_yaw_jitter_type, false)
	ui.set_visible(reference_yaw_jit_slider, false)
	ui.set_visible(reference_body_target, false)
	ui.set_visible(reference_body_yaw_limit, false)
	ui.set_visible(freestand, false)
	ui.set_visible(edge_yaw, false)
	ui.set_visible(freestanddrop, false)
else
ui.set_visible(maintain, false)
    ui.set_visible(label1, false)
	ui.set_visible(legit_e_key, false)
    ui.set_visible(label2, false)
	ui.set_visible(label3, false)
	ui.set_visible(label4, false)
    ui.set_visible(ui_desynctype, false)
    ui.set_visible(attarget, true)
	ui.set_visible(reference_pitch, true)
	ui.set_visible(reference_yaw, true)
	ui.set_visible(reference_yaw_slider, true)
	ui.set_visible(reference_body, true)
	ui.set_visible(reference_body_slider, true)
	ui.set_visible(reference_yaw_jitter_type, true)
	ui.set_visible(reference_yaw_jit_slider, true)
	ui.set_visible(reference_body_target, true)
	ui.set_visible(reference_body_yaw_limit, true)
	ui.set_visible(freestand, true)
	ui.set_visible(edge_yaw, true)
	ui.set_visible(freestanddrop, true)
end
end
handle_menu()
ui.set_callback(ui_enabledd, handle_menu)
ui.set_callback(ui_desynctype, set, on_paint)
-- [x]=========================================================================================================[x] 









-- [x]===================[ Dangerous dt  ]===================[x]
local double_tap, double_tap_key = ui.reference("RAGE", "Other", "Double tap")
local double_tap_mode = ui.reference("RAGE", "Other", "Double tap mode")
local double_tap_fake_lag_limit = ui.reference("RAGE", "Other", "Double tap fake lag limit")
local fake_lag = ui.reference("AA", "Fake lag", "Limit")
local sv_maxusrcmdprocessticks = ui.reference("MISC", "Settings", "sv_maxusrcmdprocessticks")



ui.set_visible(sv_maxusrcmdprocessticks, true)
local function do_things()
	ui.set(fake_lag, math.min(14, ui.get(fake_lag)))

		if ui.get(increase_speed_mode) then
			ui.set(sv_maxusrcmdprocessticks, 18)
			cvar.cl_clock_correction:set_int(0)
			return
		end
	
	ui.set(sv_maxusrcmdprocessticks, 16)
	cvar.cl_clock_correction:set_int(1)
end

ui.set_callback(increase_speed_mode, do_things)
ui.set_callback(fake_lag, do_shit)

-- [x]=======================================================[x]


