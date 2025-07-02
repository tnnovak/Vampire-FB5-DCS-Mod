
local Engine     = GetSelf()
local dev = Engine

dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.script_path.."devices.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
-- dofile(LockOn_Options.script_path.."utils.lua")
dofile(LockOn_Options.script_path.."Systems/SoundSystem.lua") 

local update_rate = 0.05
make_default_activity(update_rate)

local sensor_data = get_base_data()

dev:listen_command(Keys.BoosterPumpSwitch)
dev:listen_command(Keys.GyroSwitch) 
dev:listen_command(Keys.EngineStartSwitch)

-- from EDM:

local Throttle = get_param_handle("INST_Throttle")
local RPM1 = get_param_handle("INST_RPM1")
local RPM2 = get_param_handle("INST_RPM2")
local EGT = get_param_handle("INST_EGT")

local rpm_tacho = get_param_handle("INST_RPM1")

local FusTank = get_param_handle("INST_FusTank")
local RightTipTank = get_param_handle("INST_RightTipTank")
local RightWingTank = get_param_handle("INST_RightWingTank")
local LeftTipTank = get_param_handle("INST_LeftTipTank")
local LeftWingTank = get_param_handle("INST_LeftWingTank")

local GeneratorWarningLight = get_param_handle("INST_GeneratorWarningLight")
local FuelPressureWarningLight = get_param_handle("INST_FuelPressureWarningLight")
local CockpitPressureWarningLight = get_param_handle("INST_CockpitPressureWarningLight")
local WheelsNotLockedWarningLight = get_param_handle("INST_WheelsNotLockedWarningLight")
local FireWarningLight = get_param_handle("INST_FireWarningLight")

-- from EFM:

local PARAM_ThrottleState = get_param_handle("PARAM_Throttle")
local PARAM_RPM_ARG = get_param_handle("PARAM_RPM_ARG")
local PARAM_RPM1State = get_param_handle("PARAM_RPM1")
local PARAM_RPM2State = get_param_handle("PARAM_RPM2")
local PARAM_EGTState = get_param_handle("PARAM_EGT")


local PARAM_GeneratorWarningLight = get_param_handle("PARAM_GeneratorWarningLight")
local PARAM_FuelPressureWarningLight = get_param_handle("PARAM_FuelPressureWarningLight")
local PARAM_CockpitPressureWarningLight = get_param_handle("PARAM_CockpitPressureWarningLight")
local PARAM_WheelsNotLockedWarningLight = get_param_handle("PARAM_WheelsNotLockedWarningLight")
local PARAM_FireWarningLight = get_param_handle("PARAM_FireWarningLight")
local PARAM_FusTankState = get_param_handle("PARAM_FusTank")
local PARAM_LeftTipTankState = get_param_handle("PARAM_LeftTipTank")
local PARAM_LeftWingTankState = get_param_handle("PARAM_LeftWingTank")
local PARAM_RightTipTankState = get_param_handle("PARAM_RightTipTank")
local PARAM_RightWingTankState = get_param_handle("PARAM_RightWingTank")
local PARAM_EngineStartTimerState = get_param_handle("PARAM_EngineStartTimerState")

local BoosterPumpSwitch = get_param_handle("INST_Switch1.001")
local GyroSwitch = get_param_handle("INST_Switch1.002")

local PARAM_BoosterPumpSwitch = get_param_handle("PARAM_BoosterPumpSwitch")
local PARAM_GyroSwitch = get_param_handle("PARAM_GyroSwitch")

-- 0 --> not started
-- 1 --> starting
-- 2 --> running
-- 3 --> shutting down
local engine_state = 0

function post_initialize()    

    InitializeSoundSystem("Engine")

    local birth = LockOn_Options.init_conditions.birth_place
	
    if birth=="GROUND_HOT" then
	
        print_message_to_user("Ground HOT")

        engine_state = 1

    elseif birth=="AIR_HOT" then
	
        print_message_to_user("Air HOT")

        engine_state = 1

    elseif birth=="GROUND_COLD" then
	
		print_message_to_user("Ground COLD")

        engine_state = 0

    end
	
end


function SetCommand(command,value)

    if command == Keys.BoosterPumpSwitch then

        print_message_to_user("Booster Pump Switch")

        playSoundOnce(plane_sounds.sound_SwitchPush)
        playLoopingSound2(plane_sounds.sound_GyroLoop)


    elseif command == Keys.GyroSwitch then

        print_message_to_user("Gyro Start Switch")

        playSoundOnce(plane_sounds.sound_SwitchPush)

    elseif command == Keys.EngineStartSwitch then

        playSoundOnce(plane_sounds.sound_SwitchPush)
        
    end        

end


function update()

    -- updateLoopSoundParameters(plane_sounds.GoblinLoop1, rpm_tacho:get(), 1.0, 1.0, 1.0)    
    
    local rpm = PARAM_RPM_ARG:get()

    -- print_message_to_user("rpm: " .. tostring(rpm) .. " engine_state: " .. tostring(engine_state))

    -- jumped above 0, starting
    if tonumber(rpm) >= tonumber(-0.99) and engine_state==0 then        
        playSoundOnce(plane_sounds.engine_cabin_loop_start)
        engine_state = 1
        print_message_to_user("Engine starting...")
    end    

    -- crossed above or at idle 3000, started (running)
    if tonumber(rpm) >= tonumber(-0.45) and engine_state==1 then                
        engine_state = 2
        playLoopingSound2(plane_sounds.engine_cabin_loop)
        stopSound(plane_sounds.engine_cabin_loop_start)        
        print_message_to_user("Engine started")
    end    

    -- fell to 2500, shutting down
    if tonumber(rpm) <= tonumber(-0.8) and engine_state==2 then        
        playSoundOnce(plane_sounds.engine_cabin_loop_stop)
        stopSound(plane_sounds.engine_cabin_loop)
        engine_state = 3
        print_message_to_user("Engine shutting down...")
        print_message_to_user("rpm: " .. tostring(rpm))
    end    
    
    -- Engine
    Throttle:set(PARAM_ThrottleState:get())
    RPM1:set(PARAM_RPM1State:get())
    RPM2:set(PARAM_RPM2State:get())
    EGT:set(PARAM_EGTState:get())    

    -- Fuel
    FusTank:set(PARAM_FusTankState:get())
    RightWingTank:set(PARAM_RightWingTankState:get())
    LeftWingTank:set(PARAM_LeftWingTankState:get())
    
    RightTipTank:set(PARAM_RightTipTankState:get())
    LeftTipTank:set(PARAM_LeftTipTankState:get())

    -- lights

    GeneratorWarningLight:set(PARAM_GeneratorWarningLight:get())
    FuelPressureWarningLight:set(PARAM_FuelPressureWarningLight:get())
    CockpitPressureWarningLight:set(PARAM_CockpitPressureWarningLight:get())
    WheelsNotLockedWarningLight:set(PARAM_WheelsNotLockedWarningLight:get())    
    FireWarningLight:set(PARAM_FireWarningLight:get())

    -- switches animations

    BoosterPumpSwitch:set(PARAM_BoosterPumpSwitch:get())
    GyroSwitch:set(PARAM_GyroSwitch:get())


end


need_to_be_closed = false -- close lua state after initialization