--dofile(LockOn_Options.script_path.."clickable_defs.lua")
dofile(LockOn_Options.script_path.."command_defs.lua")
-- dofile(LockOn_Options.script_path.."devices.lua")
-- dofile(LockOn_Options.script_path.."sounds.lua")

function default_button(hint_,device_,command_,arg_)
	
	return  {	
				-- BTN
				-- LEV
				-- TUMB
				class 		= {class_type.BTN},
				hint  		= hint_,
				device 		= device_,
				action 		= {command_,command_},
				arg 	  	= {arg_,arg_},
				arg_value 	= {1,-1}, 
				arg_lim   	= {{-1,1},{-1,1}},
				--updatable 	= true, 
				--use_OBB 	= true				
			}
end

elements = {}

elements["PNT.001"]  =   		default_button("Engine Start Switch",				nil,Keys.EngineStartSwitch		,nil)
elements["PNT.008"]  =   		default_button("Master Ground Flight Switch",		nil,Keys.MasterFlightSwitch		,nil)
elements["PNT-LOWPV-LEVER"]  =  default_button("Low Pressure Fuel Cock",			nil,Keys.LowPressureFuelCock	,nil)
elements["PNT-HIGHPV-LEVER"]  = default_button("High Pressure Fuel Cock",			nil,Keys.HighPressureFuelCock	,nil)
elements["PNT-FLAPS-LEVER"]  =  default_button("Flaps",								nil,Keys.FlapsOn				,nil)
elements["PNT-GEAR-LEVER"]  =   default_button("Gear",								nil,Keys.Gear					,nil)
elements["PNT-GEAR-LEVER"]  =   default_button("Gear",								nil,Keys.Gear					,nil)

elements["PNT-TRIM-UP-WHEEL"]  =   default_button("Pitch Trim Up",								nil,Keys.PitchTrimUp					,nil)
elements["PNT-TRIM-DOWN-WHEEL"]  =   default_button("Pitch Trim Down",								nil,Keys.PitchTrimDown					,nil)

elements["PNT-CANOPY-LEVER"]  =   default_button("Canopy Open Close",								nil,Keys.CanopyOpenClose					,nil)

-- Weapons
    --WeaponsMaterSwitch
    --GunSafetySwitch
    --GunSightSwitch
    --RocketBombSelectorSwitch
    --RocketModeSwitch
    --BombFuseSwitch
    --PickleButton

elements["PNT.002"]  =   		default_button("Booster Pump Switch",				nil,Keys.BoosterPumpSwitch		,nil)
elements["PNT.003"]  =   		default_button("Gyro Start Switch",					nil,Keys.GyroSwitch		,nil)

elements["PNT.004"]  =   		default_button("Weapons Master Switch",				nil,Keys.WeaponsMaterSwitch		,nil)
elements["PNT.005"]  =   		default_button("Rocket / Bombs",				nil,Keys.RocketBombSelectorSwitch		,nil)
elements["PNT.006"]  =   		default_button("Rocket Mode",				nil,Keys.RocketModeSwitch		,nil)

elements["PNT.009"]  =   		default_button("Battery Switch",				nil,Keys.BatterySwitch		,nil)
elements["PNT.010"]  =   		default_button("Gunsight Switch",				nil,Keys.GunSightSwitch		,nil)

elements["PNT.011"]  =   		default_button("Cockpit Lights Switch",				nil,Keys.CockpitLightsOnOff		,nil)
elements["PNT.012"]  =   		default_button("Landing Lights Switch",				nil,Keys.LandingLightsOnOff		,nil)
-- elements["PNT.012"]  =   		default_button("Gunsight Switch",				nil,Keys.GunSightSwitch		,nil)


elements["PNT.GS.001"]  =   		default_button("Gun Sight Size",				nil,Keys.GunSightSizeMode		,nil)




