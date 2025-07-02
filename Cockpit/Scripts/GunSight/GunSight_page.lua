dofile(LockOn_Options.script_path.."GunSight/GunSight_def.lua")

visor_indicator_base 					= CreateElement "ceSimple"
visor_indicator_base.name				= create_guid_string()
visor_indicator_base.init_pos			= {0,0}
visor_indicator_base.collimated	         = true
visor_indicator_base.h_clip_relation    = h_clip_relations.COMPARE
visor_indicator_base.level              = HUD_DEFAULT_LEVEL
visor_indicator_base.element_params     = {"VISOR_VIS"}
visor_indicator_base.controllers        = {{"parameter_in_range" ,0,1}}
Add(visor_indicator_base)

local visor_indicator_bg 					= create_mfd_tex(visor_hud, 30,0, 1024-30,1024)
visor_indicator_bg.name 			        = create_guid_string()
visor_indicator_bg.init_pos                 = {0, 0}
visor_indicator_bg.collimated	            = true
visor_indicator_bg.use_mipfilter            = false
visor_indicator_bg.additive_alpha           = false
visor_indicator_bg.element_params           = {"VISOR_BRT"}
visor_indicator_bg.controllers              = {{"opacity_using_parameter",0}}
visor_indicator_bg.h_clip_relation          = h_clip_relations.COMPARE
visor_indicator_bg.level                    = HUD_DEFAULT_LEVEL
visor_indicator_bg.parent_element	     	= visor_indicator_base.name
Add(visor_indicator_bg)
	
local visor_arrow_base 				= CreateElement "ceSimple"
visor_arrow_base.name				= create_guid_string()
visor_arrow_base.init_pos			= {-0.01, 0.04}
visor_arrow_base.collimated	        = true
visor_arrow_base.use_mipfilter      = false
visor_arrow_base.additive_alpha     = false
visor_arrow_base.h_clip_relation    = h_clip_relations.COMPARE
visor_arrow_base.level              = HUD_DEFAULT_LEVEL
visor_arrow_base.parent_element	    = visor_indicator_bg.name
visor_arrow_base.element_params     = {"HUD_ARROW_ROT"}
visor_arrow_base.controllers        = {{"rotate_using_parameter" ,0,1}}
Add(visor_arrow_base)

for i=0,7 do
	local visor_arrow 					 = create_mfd_tex(visor_hud, 0,0, 30,70,nil,15,145)
	visor_arrow.name 			         = create_guid_string()
	visor_arrow.init_pos                 = {0, 0}
	visor_arrow.init_rot		    	 = {13+(i*45)}
	visor_arrow.collimated	             = true
	visor_arrow.use_mipfilter            = false
	visor_arrow.additive_alpha           = false
	visor_arrow.h_clip_relation          = h_clip_relations.COMPARE
	visor_arrow.level                    = HUD_DEFAULT_LEVEL
	visor_arrow.parent_element	     	 = visor_arrow_base.name
	visor_arrow.element_params     		 = {"VISOR_BRT", "HUD_ARROW_ROT"}
	visor_arrow.controllers        		 = {{"opacity_using_parameter",0}, {"move_up_down_using_parameter",1, 0.018}}	
	Add(visor_arrow)	
end