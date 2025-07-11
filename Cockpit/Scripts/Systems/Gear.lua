dofile(LockOn_Options.script_path.."command_defs.lua")
local dev = GetSelf()

local update_time_step = 0.01 
make_default_activity(update_time_step)
local sensor_data = get_base_data()

-- keys

local Gear  = Keys.PlaneGear
local GearUp = Keys.PlaneGearUp
local GearDown = Keys.PlaneGearDown

dev:listen_command(Gear)
dev:listen_command(GearUp)
dev:listen_command(GearDown)
dev:listen_command(GearHandle)

dev:listen_command(74)
dev:listen_command(73)

dev:listen_command(3001)
dev:listen_command(3002)
dev:listen_command(Keys.Brakes)

-- Parameters

local PARAM_PARAM_MainElectricBus = get_param_handle("PARAM_PARAM_MainElectricBus")

local PARAM_GearRedLight1 = get_param_handle("PARAM_GearRedLight1")
local PARAM_GearRedLight2 = get_param_handle("PARAM_GearRedLight2")
local PARAM_GearRedLight3 = get_param_handle("PARAM_GearRedLight3")

local PARAM_GearGreenLight1 = get_param_handle("PARAM_GearGreenLight1")
local PARAM_GearGreenLight2 = get_param_handle("PARAM_GearGreenLight2")
local PARAM_GearGreenLight3 = get_param_handle("PARAM_GearGreenLight3")

-- Gear Lights

local GearRedLight1 = get_param_handle("INST_GearRedLight1")
local GearRedLight2 = get_param_handle("INST_GearRedLight2")
local GearRedLight3 = get_param_handle("INST_GearRedLight3")

local GearGreenLight1 = get_param_handle("INST_GearGreenLight1")
local GearGreenLight2 = get_param_handle("INST_GearGreenLight2")
local GearGreenLight3 = get_param_handle("INST_GearGreenLight3")

function SetCommand(command,value)
	

    if command == 68 then		
					
        -- print_messa_to_user("Gear Command")    

    elseif command == 74 then		
					
          -- print_messa_to_user("74")          

    elseif command == 73 then		
					
          -- print_messa_to_user("73")          

    elseif command == 3001 then		
          
          -- print_messa_to_user("3001")
          
    elseif command == 3002 then		
          
          -- print_messa_to_user("3002")      
          
      elseif command == Keys.Brakes then
          
          -- print_messa_to_user("Brakes")
        
	end
end


function post_initialize()

    local birth = LockOn_Options.init_conditions.birth_place
	
    if birth=="GROUND_HOT" then
	

    elseif birth=="AIR_HOT" then
	

    elseif birth=="GROUND_COLD" then
	
    end      
   

end

function update()            

      GearRedLight1:set(PARAM_GearRedLight1:get())
      GearRedLight2:set(PARAM_GearRedLight2:get())
      GearRedLight3:set(PARAM_GearRedLight3:get())

      GearGreenLight1:set(PARAM_GearGreenLight1:get())
      GearGreenLight2:set(PARAM_GearGreenLight2:get())
      GearGreenLight3:set(PARAM_GearGreenLight3:get())  

end

need_to_be_closed = false -- close lua state after initialization
