dofile(LockOn_Options.script_path.."devices.lua") 
dofile(LockOn_Options.script_path.."command_defs.lua") 
dofile(LockOn_Options.script_path.."SYSTEMS/SoundSystem.lua")


local WeaponSystem = GetSelf()
local update_rate = 0.02 -- 50 times / sec
make_default_activity(update_rate)

local WeaponsSwitch = get_param_handle("WEAPONS_SWITCH") 

local loadMode = 0 -- 0 --> Bombs, 1 --> Rockets
local rocketsSalvoMode= 0 -- 0 --> ALL, 1 --> SINGLE

local load_type = 0 --> rockets only, 1 --> (mixed) rockets and bombs 2 --> bombs only

local numberOfRockets = 0
local numberOfRocketsRemaining = 0

local numberOfBombs = 0
local numberOfBombsRemaining = 0

local MasterArm = 0
local rocketsSalvoCount = 0

local MasterArm_S003 = get_param_handle("INST_Switch1.003") -- master Weapons arm
local BombRockets_S004 = get_param_handle("INST_Switch1.004") -- bomb / rockets 
local SalvoMode_S005 = get_param_handle("INST_Switch1.005") -- salvo mode (all/ single)

local iCommandWeaponsMaterSwitch = Keys.WeaponsMaterSwitch
local iCommandGunSafetySwitch = Keys.GunSafetySwitch

local iCommandRocketBombSelectorSwitch = Keys.RocketBombSelectorSwitch
local iCommandRocketModeSwitch = Keys.RocketModeSwitch
local iCommandBombFuseSwitch = Keys.BombFuseSwitch
local iCommandPickleButton = Keys.PickleButton

WeaponSystem:listen_command(iCommandWeaponsMaterSwitch)
WeaponSystem:listen_command(iCommandGunSafetySwitch)

WeaponSystem:listen_command(iCommandRocketBombSelectorSwitch)
WeaponSystem:listen_command(iCommandRocketModeSwitch)
WeaponSystem:listen_command(iCommandBombFuseSwitch)
WeaponSystem:listen_command(iCommandPickleButton)
WeaponSystem:listen_command(Keys.GunSightSizeMode)
WeaponSystem:listen_command(Keys.GunSightSwitch)

local PARAM_GunSightSwitch = get_param_handle("PARAM_GunSightSwitch")
local PARAM_MainElectricBus = get_param_handle("PARAM_MainElectricBus")
local GS_VIS = get_param_handle("GUNSIGHT_VIS")

local GunSightSizeSelKnob = get_param_handle("INST_GunSightSizeSelKnob")
local GunSightSwitch = get_param_handle("INST_Switch1.009")

local current_gs_size_index = 1;
local gs_arg_value = 1
local gvis = 1.5
local gunsight_set = 0

local GunSightSizeKnobArgValue = {
    [1] = 1.0,
    [2] = 0.671,
    [3] = 0.352,
    [4] = 0.033,
    [5] = -0.23,
    [6] = -0.418,
    [7] = -0.596,
    [8] = -0.803,
    [9] = -0.972
}

function map_range(value, in_min, in_max, out_min, out_max)
    return (value - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
end

function CheckLoad() 

    -- print_messa_to_user("CheckLoad()")

    -- Master ARM to OFF
    WeaponsSwitch:set(0.0)

    -- *************************************************
    -- Check load
    -- *************************************************    

    local ST = WeaponSystem:get_station_info(0)

    local STCLSID = ST.CLSID              

    -- print_messa_to_user("Checking LOADOUT...")

    for stn=0,3,1 do 

        local ST = WeaponSystem:get_station_info(stn)

        -- -- print_messa_to_user("Load="..ST.CLSID)

        if (ST~=nil) then       

            local STCLSID = ST.CLSID  
            
            if (STCLSID=='{British_AP_25LBNo1_3INCHNo1}') then                
                numberOfRockets = numberOfRockets + 1
            end   

            if (STCLSID=='{British_GP_500LB_Bomb_Mk1}') then
                numberOfBombs = numberOfBombs + 1
            end

        end   

    end    
    
    if (numberOfRockets>0) then
        -- print_messa_to_user("RP-3 ROCKETS LOAD FOUND")
        -- print_messa_to_user("TOTAL ROCKETS="..tostring(numberOfRockets))    
    end    

    if (numberOfBombs>0) then
        -- print_messa_to_user("500LB BOMBS LOAD FOUND")
        -- print_messa_to_user("TOTAL BOMBS="..tostring(numberOfBombs))    
    end

    numberOfRocketsRemaining = numberOfRockets
    numberOfBombsRemaining = numberOfBombs

    if (numberOfBombs == 4 and numberOfBombs==0) then
        -- print_messa_to_user("Rockets Only")
        load_type = 0
    end    

    if (numberOfBombs > 0 and numberOfRockets > 0) then
        -- print_messa_to_user("Mixed Load")
        load_type = 1
    end

    if (numberOfBombs > 0 and numberOfRockets==0) then
        -- print_messa_to_user("Bombs Only")
        load_type = 2
    end

end    

function post_initialize()

    CheckLoad()    
               
    local birth = LockOn_Options.init_conditions.birth_place	--"GROUND_COLD","GROUND_HOT","AIR_HOT"

    if birth=="GROUND_HOT" or birth=="AIR_HOT" then 	
        
        -- print_messa_to_user("birth= GROUND_HOT or AIR_HOT")

        
    elseif birth=="GROUND_COLD" then
       
        -- print_messa_to_user("birth= GROUND_COLD")

    end    

    InitializeSoundSystem("Weapons")
    -- print_messa_to_user("WeaponSystem post_initialize COMPLETED")

end    


function SetCommand(command,value)

    if command == iCommandWeaponsMaterSwitch then

        -- print_messa_to_user("-- SWITCH MASTER ARM --")        
            
        if MasterArm == 1 then            
            -- print_messa_to_user("MASTER ARM OFF")
            WeaponsSwitch:set(0.0)
            MasterArm = 0
            MasterArm_S003:set(0.0)
        else            
            -- print_messa_to_user("MASTER ARM ON")
            WeaponsSwitch:set(0.5)
            MasterArm = 1    
            MasterArm_S003:set(1.0)        
        end  

        playSoundOnce(plane_sounds.sound_LeveMove4)

    elseif command == iCommandRocketBombSelectorSwitch then        

        if (loadMode==0) then
            -- print_messa_to_user("ROCKETS SELECTED")
            loadMode = 1
            BombRockets_S004:set(1.0)            
        else
            -- print_messa_to_user("BOMBS SELECTED")
            loadMode = 0            
            BombRockets_S004:set(0.0)            
        end

        playSoundOnce(plane_sounds.sound_LeveMove4)
        
    elseif command == iCommandRocketModeSwitch then

        -- print_messa_to_user("rocketsSalvoMode="..rocketsSalvoMode)                

        if rocketsSalvoMode == 1  then
                    
            rocketsSalvoMode = 0

            -- print_messa_to_user("SALVO MODE 0 (ALL)")

            WeaponsSwitch:set(1.0)       
            SalvoMode_S005:set(0.0)     

        elseif  rocketsSalvoMode == 0 then

            rocketsSalvoMode = 1

            -- print_messa_to_user("SALVO MODE 1 (SINGLE)")

            -- print_messa_to_user("numberOfRocketsRemaining="..numberOfRocketsRemaining)
            -- print_messa_to_user("rocketsSalvoCount="..rocketsSalvoCount)            

            WeaponsSwitch:set(0.5)
            SalvoMode_S005:set(1.0)     
            
        end          

        playSoundOnce(plane_sounds.sound_LeveMove4)
        
    elseif command == iCommandPickleButton then  

        if (loadMode==0) then

            if MasterArm==1 then

                -- print_messa_to_user("-- DROP BOMBS --")

                if (numberOfBombsRemaining>0) then

                    numberOfBombsRemaining = numberOfBombsRemaining - 2

                    -- print_messa_to_user("First Batch")
                                    
                    WeaponSystem:launch_station(1)                                                
                    WeaponSystem:launch_station(2)                                                
                                
                else
                    
                    -- print_messa_to_user("NO BOMBS IN THE RACKS")

                end
            
            else
                
                -- print_messa_to_user("WARN: WEAPONS MASTER ARM OFF")
                
            end


        end    
        
        if (loadMode==1) then

            -- print_messa_to_user("-- FIRE ROCKETS --")

            if (MasterArm==1) then

                -- Shoot everything 
                if (rocketsSalvoMode==0) then

                    -- print_messa_to_user("SM0 --> ALL")

                    if (numberOfRocketsRemaining>0) then

                        numberOfRocketsRemaining = 0
            
                        -- print_messa_to_user("First Batch")
                        
                        -- only rockets load
                        if (load_type==0) then
                            WeaponSystem:launch_station(0)                                                
                            WeaponSystem:launch_station(1)                                                
                            WeaponSystem:launch_station(2)                                                
                            WeaponSystem:launch_station(3)                                                
                        end

                        -- mixed load
                        if (load_type==1) then
                            WeaponSystem:launch_station(0)                                                
                            WeaponSystem:launch_station(3)                                                
                        end
                        
                    else
                        
                        -- print_messa_to_user("NO ROCKETS IN THE RACKS")

                    end    

                end    

                -- Shoot single
                if (rocketsSalvoMode==1) then

                    -- print_messa_to_user("SM1 --> SINGLE")

                    if (numberOfRocketsRemaining>=0) then
            
                        -- only rockets load
                        if (load_type==0) then
                            WeaponSystem:launch_station(rocketsSalvoCount)                       
                        end
                        
                        if (load_type==1) then
                            if (rocketsSalvoCount==0) then
                                WeaponSystem:launch_station(0) -- 1st station
                            else
                                WeaponSystem:launch_station(3) -- 4th station
                            end
                        end

                        numberOfRocketsRemaining = numberOfRocketsRemaining - 1

                        -- print_messa_to_user("numberOfRocketsRemaining="..numberOfRocketsRemaining)
                        -- print_messa_to_user("rocketsSalvoCount="..rocketsSalvoCount)

                        rocketsSalvoCount = rocketsSalvoCount + 1;                

                        if (rocketsSalvoCount>=numberOfRockets) then
                            rocketsSalvoCount = 0
                        end    

                    else
                        
                        -- print_messa_to_user("NO ROCKETS IN THE RACKS")

                    end

                end  
                        
            
            else

                -- print_messa_to_user("WARN: WEAPONS MASTER ARM OFF")

            end        

        end

    elseif command == Keys.GunSightSizeMode then     
        
        current_gs_size_index = current_gs_size_index + 1

        if current_gs_size_index >= 10 then
            current_gs_size_index = 1
        end

        -- print_messa_to_user("Gun Sight Size Mode: "..current_gs_size_index)

        gs_arg_value = GunSightSizeKnobArgValue[current_gs_size_index]
        -- gs_arg_value = map_range(current_gs_size_index, 1, 9, -1.0, 1.0)

        gvis = current_gs_size_index + 0.5
        gunsight_set = 1

        -- print_messa_to_user("GunSightSizeKnobArgValue: "..gs_arg_value)                    
        -- print_messa_to_user("GS VIS Arg: "..gvis)

    elseif command == Keys.GunSightSwitch then

        playSoundOnce(plane_sounds.sound_SwitchPush)
        
        -- print_messa_to_user("Gun Sight Switch ON/OFF")

    end       
   
end

function update()         

        GunSightSizeSelKnob:set(gs_arg_value)

        if (gunsight_set==0) then
            gvis = 1.5
        end

        if (PARAM_MainElectricBus:get()==0) then 
            gvis = 0.0            
        end            

        if (PARAM_GunSightSwitch:get()==0) then
            gvis = 0.0
        end        
   
        GS_VIS:set(gvis)

        if (PARAM_GunSightSwitch:get()==1) then
           GunSightSwitch:set(1)
        else
           GunSightSwitch:set(0)
        end

   
end



need_to_be_closed = false -- close lua state after initialization
