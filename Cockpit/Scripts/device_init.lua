dofile(LockOn_Options.common_script_path.."tools.lua")
dofile(LockOn_Options.script_path.."devices.lua")

layoutGeometry = {}

MainPanel = {"ccMainPanel",LockOn_Options.script_path.."mainpanel_init.lua",
{},
}

creators                          = {}

creators[devices.ENGINE]          = {"avLuaDevice"           ,LockOn_Options.script_path.."Systems/Engine.lua"}
creators[devices.AVIONICS]        = {"avLuaDevice"           ,LockOn_Options.script_path.."Systems/Avionics.lua"}
creators[devices.GEAR]		      = {"avLuaDevice"			,LockOn_Options.script_path.."Systems/Gear.lua"}
creators[devices.WEAPON_SYSTEM]   = {"avSimpleWeaponSystem"           ,LockOn_Options.script_path.."Systems/WeaponSystem.lua"}
 
-- -- Indicators
indicators	= {}

local id_count = 0

indicators[id_count] = {
	"ccIndicator",
	LockOn_Options.script_path.."ControlsIndicator/ControlsIndicator.lua",
	devices.CONTROL_INTERFACE
}
id_count = id_count + 1


indicators[id_count]				= {
	"ccIndicator",
	LockOn_Options.script_path.."GunSight/GunSight_init.lua",
	nil,
	{
		{"PNT-HUD-CENTER","PNT-HUD-DOWN","PNT-HUD-RIGHT"},
		{
			sz_l = -0.01,
			sy_l = -0.065,
			sx_l = 0.1,
			rz_l = 1,
			sh =0,
			sw = 0.005
		}
	}
}
id_count = id_count + 1

