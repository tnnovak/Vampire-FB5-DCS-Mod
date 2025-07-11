dofile(LockOn_Options.common_script_path.."elements_defs.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
-- dofile(LockOn_Options.script_path.."functions.lua")
dofile(LockOn_Options.script_path.."Systems/SoundSystem.lua")

local dev = GetSelf()

local update_time_step = 0.02 --update will be called 50 times per second
make_default_activity(update_time_step)

local sensor_data = get_base_data()


-- **************************************************** 
-- Keys to watch
-- **************************************************** 

dev:listen_command(5300) -- Master Flight Switch
dev:listen_command(5380) -- Low pressure fuel cock
dev:listen_command(5390) -- High pressure fuel cock
dev:listen_command(5400) -- Engine start switch

dev:listen_command(7430) -- Left gear brake
dev:listen_command(7431) -- Left gear brake

dev:listen_command(7445) -- Right gear brake
dev:listen_command(7446) -- Right gear brake

dev:listen_command(8000) -- Brakes

dev:listen_command(5410) -- Flaps ON
dev:listen_command(72) -- Flaps ON

dev:listen_command(84) -- Guns


dev:listen_command(5420) -- Flaps OFF

local iCommandStickHide = Keys.StickHideShow

dev:listen_command(iCommandStickHide) -- Stick Hide/Show
dev:listen_command(Keys.BatterySwitch) 
dev:listen_command(Keys.CanopyOpenClose)

local canopy_arg_value = -1
local canopy_state = 0 -- 0 = closed, 1 = openning , 2 = open, 3 = closing

-- gunsight commands

dev:listen_command(Keys.GunSightMoveUp)
dev:listen_command(Keys.GunSightMoveDown)
dev:listen_command(Keys.GunSightMoveLeft)
dev:listen_command(Keys.GunSightMoveRight)
dev:listen_command(Keys.CockpitLightsOnOff)
dev:listen_command(Keys.LandingLightsOnOff)
dev:listen_command(Keys.ShowHideDebugScreen)

-- from EDM:

local Canopy = get_param_handle("INST_Canopy")
local CanopyLever = get_param_handle("INST_CanopyLever")

local ALT1 = get_param_handle("INST_ALT1")
local ALT2 = get_param_handle("INST_ALT2")
local ALT3 = get_param_handle("INST_ALT3")
local Climb = get_param_handle("INST_Climb")
local Clock1 = get_param_handle("INST_Clock1")
local Clock2 = get_param_handle("INST_Clock2")
local Clock3 = get_param_handle("INST_Clock3")
local Compass = get_param_handle("INST_Compass")
local TSIndicator = get_param_handle("INST_TSIndicator")
local Flaps = get_param_handle("INST_Flaps")
local GearLever = get_param_handle("INST_GearLever")
local PitchTrimWheel = get_param_handle("INST_PitchTrimWheel")

local Gmeter = get_param_handle("INST_Gmeter")
local UpperRightPress = get_param_handle("INST_UpperRightPress")

local OilPress = get_param_handle("INST_OilPress")
local PedalYaw = get_param_handle("INST_PedalYaw")
--local PitchTrim = get_param_handle("INST_PitchTrim")
local Pneupress = get_param_handle("INST_Pneupress")
local HighPressureFuelCock = get_param_handle("INST_HighPressureFuelCock")
local LowPressureFuelCock = get_param_handle("INST_LowPressureFuelCock")
local Speed = get_param_handle("INST_Speed")
local StickPitch = get_param_handle("INST_StickPitch")
local StickRoll = get_param_handle("INST_StickRoll")
local Turn = get_param_handle("INST_Turn")
local Voltage = get_param_handle("INST_Voltage")

local BatterySwitch = get_param_handle("INST_Switch1.008")

local CockpitLightSwitch = get_param_handle("INST_Switch1.011")
local NavigationLightsSwitch = get_param_handle("INST_Switch1.012")

local HorizonRoll = get_param_handle("INST_HorizonRoll")
local HorizonVert = get_param_handle("INST_HorizonVert")
local StarterButton = get_param_handle("INST_StarterButton")
local TrimIndicator = get_param_handle("INST_TrimIndicator")
local LowerLeftPress = get_param_handle("INST_LowerLeftPress")
local LeftOilPress = get_param_handle("INST_LeftOilPress")
local MasterFlightSwitch = get_param_handle("INST_MasterFlightSwitch")

local TurnAndBankRate = get_param_handle("INST_TurnAndBankRate")
local TurnAndBankSlip = get_param_handle("INST_TurnAndBankSlip")

local CockpitLight = get_param_handle("INST_CockpitLight")

local CockpitLightState = 0
local NavigationLightsState = 0

local PARAM_TurnAndBankRate = get_param_handle("PARAM_TurnAndBankRate")
local PARAM_TurnAndBankSlip = get_param_handle("PARAM_TurnAndBankSlip")

local mag_heading = 0
local last_mag_heading = 0
local turn_speed = 0

local MasterFlightSwitchState = get_param_handle("PARAM_MasterSwitchState")

--local switch1 = get_param_handle("INST_Switch1")
--local switch1_001 = get_param_handle("INST_Switch1.001")
--local switch1_002 = get_param_handle("INST_Switch1.002")
--local switch1_004 = get_param_handle("INST_Switch1.004")
--local switch1_005 = get_param_handle("INST_Switch1.005")
--local switch1_006 = get_param_handle("INST_Switch1.006")

-- Values from EFM:

local PARAM_ALT1State = get_param_handle("PARAM_ALT1")
local PARAM_ALT2State = get_param_handle("PARAM_ALT2")
local PARAM_ALT3State = get_param_handle("PARAM_ALT3")
local PARAM_ClimbState = get_param_handle("PARAM_Climb")
local PARAM_Clock1State = get_param_handle("PARAM_Clock1")
local PARAM_Clock2State = get_param_handle("PARAM_Clock2")
local PARAM_Clock3State = get_param_handle("PARAM_Clock3")
local PARAM_CompassState = get_param_handle("PARAM_Compass")
local PARAM_TSIndicatorState = get_param_handle("PARAM_TSIndicator")

local PARAM_FlapsState = get_param_handle("PARAM_Flaps")
local PARAM_GearLeverState = get_param_handle("PARAM_Gear")

local PARAM_GmeterState = get_param_handle("PARAM_Gmeter")

local PARAM_RPM1State = get_param_handle("PARAM_RPM1")
local PARAM_OilPressState = get_param_handle("PARAM_OilPress")
local PARAM_PedalYawState = get_param_handle("PARAM_PedalYaw")
local PARAM_PitchTrimState = get_param_handle("PARAM_PitchTrim")
local PARAM_PneupressState = get_param_handle("PARAM_Pneupress")
local PARAM_HighPressureFuelCockState = get_param_handle("PARAM_HighPressureFuelCock")
local PARAM_LowPressureFuelCockState = get_param_handle("PARAM_LowPressureFuelCock")
local PARAM_SpeedState = get_param_handle("PARAM_Speed")
local PARAM_StickPitchState = get_param_handle("PARAM_StickPitch")
local PARAM_StickRollState = get_param_handle("PARAM_StickRoll")
local PARAM_TurnState = get_param_handle("PARAM_Turn")
local PARAM_VoltageState = get_param_handle("PARAM_Voltage")

local PARAM_HorizonRollState = get_param_handle("PARAM_HorizonRoll")
local PARAM_HorizonVertState = get_param_handle("PARAM_HorizonVert")
local PARAM_TrimIndicatorState = get_param_handle("PARAM_TrimIndicator")
local PARAM_LowerLeftPressState = get_param_handle("PARAM_LowerLeftPress")
local PARAM_LeftOilPressState = get_param_handle("PARAM_LeftOilPress")

local PARAM_StarterButtonState = get_param_handle("PARAM_StarterButton")
local PARAM_MasterFlightSwitchState = get_param_handle("PARAM_MasterFlightSwitch")
local PARAM_BatterySwitch = get_param_handle("PARAM_BatterySwitch")
local PARAM_MainElectricBus = get_param_handle("PARAM_MainElectricBus")

-- Pressure Gauges

local PARAM_HydraulicPressure = get_param_handle("PARAM_HydraulicPressure")

local StickHide = get_param_handle("INST_StickHide")

-- Guns Sight Tests

local GunSightVPOS = get_param_handle("GUNSIGHT_VPOS")
local GunSightHPOS = get_param_handle("GUNSIGHT_HPOS")

local GS_VPOS = -0.02
local GS_HPOS = 0
local GS_POS_INC = 0.001

local PARAM_ShowDebugScreen = get_param_handle("PARAM_ShowDebugScreen")

function post_initialize()

        InitializeSoundSystem("Avionics")     
        
        -- print_messa_to_user("LockOn_Options.script_path: "..LockOn_Options.script_path)

        local birth = LockOn_Options.init_conditions.birth_place

        canopy_arg_value = -1
        set_aircraft_draw_argument_value(2160, canopy_arg_value)
        Canopy:set(canopy_arg_value) 
        CanopyLever:set(canopy_arg_value)        

        if birth=="GROUND_HOT" then

                -- print_messa_to_user("GROUND_HOT")
                canopy_arg_value = -1
                canopy_state = 0 

        elseif birth=="AIR_HOT" then

                -- print_messa_to_user("AIR HOT START")
                canopy_arg_value = -1
                canopy_state = 0 

        elseif birth=="GROUND_COLD" then

                -- print_messa_to_user("GROUND_COLD")
                canopy_arg_value = -1
                canopy_state = 0 
                        
        end

        Canopy:set(canopy_arg_value) 
        CanopyLever:set(canopy_arg_value)
        set_aircraft_draw_argument_value(2160, canopy_arg_value)        

        -- Gun Sight initial position    
        GunSightHPOS:set( 0.01) -- Horizontal position
        GunSightVPOS:set(-0.03) -- Vertical position

    
end

function SetCommand(command,value)
    

    if command==5300 then

        -- print_messa_to_user("Master Ground / Flight Switch")

        playSoundOnce(plane_sounds.sound_SwitchPush)
	
    elseif command==5380 then
		
		-- print_messa_to_user("Low Pressure Fuel cock")

        playSoundOnce(plane_sounds.sound_SwitchPush)

    elseif command==5390 then
		
		-- print_messa_to_user("High Pressure Fuel cock")

        playSoundOnce(plane_sounds.sound_SwitchPush)

    elseif command==5400 then
		
		-- print_messa_to_user("Engine Start Switch")       

        playSoundOnce(plane_sounds.sound_SwitchPush)
        
    elseif command==7430 then 

        -- print_messa_to_user("Left Gear Brake 7430 short")

      elseif command==7431 then 

        -- print_messa_to_user("Left Gear Brake 7431 long")
        
    elseif command==7445 then   

        -- print_messa_to_user("Right Gear Brake 7445 short") 
        
    elseif command==7446 then   

        -- print_messa_to_user("Right Gear Brake 7446 long")         

    elseif command==8000 then   

        -- print_messa_to_user("Brakes 8000")         

    elseif command==5410 then

        -- print_messa_to_user("Flaps ON 5410")

    elseif command==72 then

        -- print_messa_to_user("Flaps ON 72")


    elseif command==5420 then 

        -- print_messa_to_user("Flaps OFF 5420")        

    elseif command==84 then 

        -- print_messa_to_user("Guns 84")        

    elseif command==iCommandStickHide then

        -- print_messa_to_user("Stick Hide/Show")

        if (StickHide:get() == -1) then
             StickHide:set(1)
         else
             StickHide:set(-1)
         end

    elseif command==Keys.GunSightMoveUp then

        GS_VPOS = GS_VPOS + GS_POS_INC
        GunSightVPOS:set(GS_VPOS)

        -- print_messa_to_user("Gun Sight Move Up: "..GS_VPOS)

    elseif command==Keys.GunSightMoveDown then          
        
        GS_VPOS = GS_VPOS - GS_POS_INC
        GunSightVPOS:set(GS_VPOS)

        -- print_messa_to_user("Gun Sight Move Down: "..GS_VPOS)

    elseif command==Keys.GunSightMoveLeft then
        GS_HPOS = GS_HPOS - GS_POS_INC
        GunSightHPOS:set(GS_HPOS)

        -- print_messa_to_user("Gun Sight Move Left: "..GS_HPOS)

    elseif command==Keys.GunSightMoveRight then

        GS_HPOS = GS_HPOS + GS_POS_INC
        GunSightHPOS:set(GS_HPOS)

        -- print_messa_to_user("Gun Sight Move Right: "..GS_HPOS)

    elseif command==Keys.BatterySwitch then

        playSoundOnce(plane_sounds.sound_SwitchPush)

        -- print_messa_to_user("Battery Switch ON/OFF")

    elseif command==Keys.CockpitLightsOnOff then

        playSoundOnce(plane_sounds.sound_SwitchPush)        

        if (CockpitLightState == 0) then
            if PARAM_MainElectricBus:get() >= 0 then
                CockpitLight:set(1)                
            end 
            CockpitLightState = 1                   
            CockpitLightSwitch:set(1)
        else
            CockpitLight:set(0)
            CockpitLightState = 0
            CockpitLightSwitch:set(0)
        end

        -- print_messa_to_user("Cockpit Lights ON/OFF")

    elseif command==Keys.LandingLightsOnOff then

        playSoundOnce(plane_sounds.sound_SwitchPush)

        if NavigationLightsState == 0 then
            if PARAM_MainElectricBus:get() >= 0 then
                set_aircraft_draw_argument_value(2130, 1) -- Show Landing Lights
                set_aircraft_draw_argument_value(2150, 1) -- Show Landing Lights
            end
             NavigationLightsSwitch:set(1)            
            NavigationLightsState = 1
        else
            NavigationLightsSwitch:set(0)            
            NavigationLightsState = 0
            set_aircraft_draw_argument_value(2130, 0) -- Hide Landing Lights
            set_aircraft_draw_argument_value(2150, 0) -- Show Landing Lights
        end

        -- print_messa_to_user("Landing Lights ON/OFF")


    elseif command==Keys.CanopyOpenClose then

        -- print_messa_to_user("Canopy Open/Close")        

        if canopy_state == 0 then             
            canopy_state = 1
            return
        end    

        if canopy_arg_value == 1 or canopy_state== 2 then 
            canopy_state = 3
            return
        end    

    elseif command==Keys.ShowHideDebugScreen then

        if (PARAM_ShowDebugScreen:get() == 1) then
            PARAM_ShowDebugScreen:set(0)
            -- print_messa_to_user("Hiding Debug Screen")
        else
            PARAM_ShowDebugScreen:set(1)
            -- print_messa_to_user("Showing Debug Screen")
        end        


    else
        -- -- print_messa_to_user("Command not handled: "..command)

    end    

end

function OpenCloseCanopy()

    if canopy_state == 1 then
        canopy_arg_value = canopy_arg_value + 0.05
        if (canopy_arg_value >=1 ) then
            canopy_state = 2
            canopy_arg_value = 1
            if (PARAM_RPM1State:get() >= -0.95) then
                playLoopingSound2(plane_sounds.AirflowLoop)
            end    
        end
        Canopy:set(canopy_arg_value) 
        CanopyLever:set(canopy_arg_value)
        set_aircraft_draw_argument_value(2160, canopy_arg_value) -- Canopy opening        
    end 

    if canopy_state == 3 then
        canopy_arg_value = canopy_arg_value - 0.05
        if (canopy_arg_value <=-1 ) then
            canopy_state = 0
            canopy_arg_value = -1
            stopLoopingSound2(plane_sounds.AirflowLoop)
        end
        Canopy:set(canopy_arg_value) 
        CanopyLever:set(canopy_arg_value)
        set_aircraft_draw_argument_value(2160, canopy_arg_value) -- Canopy closing        
    end 


end


function update()

    OpenCloseCanopy()

    -- Start sequence
    MasterFlightSwitch:set(PARAM_MasterFlightSwitchState:get())
    StarterButton:set(PARAM_StarterButtonState:get())    
    BatterySwitch:set(PARAM_BatterySwitch:get())

    HighPressureFuelCock:set(PARAM_HighPressureFuelCockState:get())
    LowPressureFuelCock:set(PARAM_LowPressureFuelCockState:get())
        
    -- Controls
    PedalYaw:set(PARAM_PedalYawState:get())
    --PitchTrim:set(PARAM_PitchTrimState:get())    
    PitchTrimWheel:set(PARAM_TrimIndicatorState:get())    
    StickPitch:set(PARAM_StickPitchState:get())
    StickRoll:set(PARAM_StickRollState:get())

    -- Flaps and Gear
    Flaps:set(PARAM_FlapsState:get())    
    GearLever:set(PARAM_GearLeverState:get() * 4)

    -- Basic Instruments
    Speed:set(PARAM_SpeedState:get())
    ALT1:set(PARAM_ALT1State:get())
    ALT2:set(PARAM_ALT2State:get())
    ALT3:set(PARAM_ALT3State:get())
    Climb:set(PARAM_ClimbState:get())
    --Clock1:set(PARAM_Clock1State:get())
    --Clock2:set(PARAM_Clock2State:get())
    --Clock3:set(PARAM_Clock3State:get())

    --  -1 --> N, 
    --   0 --> S,
    --   1 --> N
    -- (sensor_data.getHeading() 			* 180.0) / 3.14)
    -- (sensor_data.getMagneticHeading() 	* 180.0) / 3.14)
    -- Compass:set(PARAM_CompassState:get())

    local heading_rad = sensor_data.getMagneticHeading()
    local heading_deg = (heading_rad * 180.0) / math.pi
    local compass_norm = (heading_deg / 180) - 1  -- -1 at 0°, 0 at 180°, 1 at 360°
    Compass:set(compass_norm)

    mag_heading = heading_deg
    turn_speed = (mag_heading - last_mag_heading) * (1/0.02)
    last_mag_heading = mag_heading

    TurnAndBankRate:set(turn_speed/15)
    TurnAndBankSlip:set(PARAM_TurnAndBankSlip:get())

    TSIndicator:set(PARAM_TSIndicatorState:get())        
    Gmeter:set(PARAM_GmeterState:get())
    Turn:set(PARAM_TurnState:get())
    Voltage:set(PARAM_VoltageState:get())
    HorizonRoll:set(PARAM_HorizonRollState:get())
    HorizonVert:set(PARAM_HorizonVertState:get())
    TrimIndicator:set(PARAM_TrimIndicatorState:get())
        

    -- Pressure Gauges
    UpperRightPress:set(PARAM_HydraulicPressure:get())    

    --OilPress:set(PARAM_OilPressState:get())
    --Pneupress:set(PARAM_PneupressState:get())
    --LowerLeftPress:set(PARAM_LowerLeftPressState:get())
    --LeftOilPress:set(PARAM_LeftOilPressState:get())
    

end


need_to_be_closed = false -- close lua state after initialization


