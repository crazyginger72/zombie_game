local function get_status ( )
	local status = minetest.get_server_status()
    return (""..status..""):format(ha, m, dn);
end

local timer = 0;

local player_hud = { };

minetest.register_globalstep(function ( dtime )
    timer = timer + dtime;
    if (timer >= 5.0) then
        timer = 0;
        for _,p in ipairs(minetest.get_connected_players()) do
            local name = p:get_player_name();
            local h = p:hud_add({
                hud_elem_type = "text";
                position = {x=0.50, y=0.890};
                text = get_status();
                number = 0xFF00FF;
            });
            if (player_hud[name]) then
                p:hud_remove(player_hud[name]);
            end
            player_hud[name] = h;



        end
    end
end);

