--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-----------------Minetest Time--kazea's code tweeked by cg72--------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

------settings------
--------------------

show_status = false  --shows server status all the time


local player_hud = { };

local timer = 0;

local function floormod ( x, y )
    return (math.floor(x) % y);
end

local function get_time ( )
	local dn, secs, s, m, h, ha
    secs = (60*60*24*minetest.env:get_timeofday());
    s = floormod(secs, 60);
    m = floormod(secs/60, 60);
    h = floormod(secs/3600, 60);
	if h >= 12 then
			ha = h - 12;
			dn = "pm";
			elseif h < 12 then
			ha = h;
			dn = "am";
			end
    return ("Minetest time %02d:%02d "..dn..""):format(ha, m, dn);
end

minetest.register_globalstep(function ( dtime )
    timer = timer + dtime;
    if (timer >= 5.0) then
        timer = 0;
        for _,p in ipairs(minetest.get_connected_players()) do
            local name = p:get_player_name();
            local h = p:hud_add({
                hud_elem_type = "text";
                position = {x=0.20, y=0.965};
                text = get_time();
                number = 0xFF00FF;
            });
            if (player_hud[name]) then
                p:hud_remove(player_hud[name]);
            end
            player_hud[name] = h;



        end
    end
end);

if show_status == true then 
dofile(minetest.get_modpath("minetest_time").."/status.lua")
end
