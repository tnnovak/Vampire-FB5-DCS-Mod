local Engine     = GetSelf()
local dev = Engine

dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
dofile(LockOn_Options.script_path.."utils.lua")
-- dofile(LockOn_Options.script_path.."sounds.lua")

local update_rate = 0.05
make_default_activity(update_rate)

local sensor_data = get_base_data()




function post_initialize()


    local birth = LockOn_Options.init_conditions.birth_place
	
    if birth=="GROUND_HOT" then
	

    elseif birth=="AIR_HOT" then
	

    elseif birth=="GROUND_COLD" then
	
		
    end
	
end


function SetCommand(command,value)


end


function update()



end


need_to_be_closed = false -- close lua state after initialization

