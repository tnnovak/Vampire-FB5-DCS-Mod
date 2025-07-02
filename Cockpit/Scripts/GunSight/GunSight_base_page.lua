dofile(LockOn_Options.script_path.."GunSight/GunSight_def.lua")

SHOW_MASKS = true

local aspect     = 1
local xpos       = 0
local ypos       = 0

local TST  		 = MakeMaterial(nil,{0,0,0,0})
local SHOW_MASKS = false		 
			 
-- local aspect       = GetAspect()  -- GetHalfHeight()/GetHalfWidth()

nav_total_field_of_view 				= CreateElement "ceMeshPoly"
nav_total_field_of_view.name 			= create_guid_string()
nav_total_field_of_view.primitivetype 	= "triangles"
nav_total_field_of_view.vertices	    = { {-aspect , aspect }, { aspect,aspect}, { aspect,-aspect}, {-aspect,-aspect}, }
nav_total_field_of_view.indices			= {0, 1, 2, 0, 2, 3}
nav_total_field_of_view.init_pos		= {0, 0, 0}
nav_total_field_of_view.material		= TST
nav_total_field_of_view.h_clip_relation = h_clip_relations.REWRITE_LEVEL
nav_total_field_of_view.level			= HUD_DEFAULT_LEVEL
nav_total_field_of_view.change_opacity	= false
nav_total_field_of_view.collimated 		= false
nav_total_field_of_view.isvisible		= true
-- Add(nav_total_field_of_view)



HUD_DEBUG_BLACK	= MakeMaterial(nil,{0,0,0,140})

local x_size = 0.4
local y_size = 0.1

local 	total_field_of_view 				= CreateElement "ceMeshPoly"
		total_field_of_view.name 			= create_guid_string()
		total_field_of_view.primitivetype 	= "triangles"
		total_field_of_view.vertices		= {	{-x_size - 0.2, 0.3},
												{ x_size + 0.4, 0.3},
												{ x_size + 0.5,-y_size - 1.4},
												{-x_size - 0.2,-y_size - 1.4},
												
												{-x_size * 0.8, y_size * 0.5},	--4
												{-x_size * 1.1, 0},	
												{ x_size * 0.9, y_size * 0.5},	--6
												{ x_size * 1.1, 0},	
												
												{-x_size * 1.1, y_size * 0.5},	--8
												{0, y_size/2  },
												}
		total_field_of_view.indices		 	= {0, 1, 2, 	0, 2, 3,	0,4,5,	1,6,7,	4,5,6,	6,7,5,	4,8,9,	6,8,9}  
		total_field_of_view.init_rot	  	= {0.0, -0.55, -50}
		total_field_of_view.init_pos	  	= {0.1, 1.0,-2 }
		total_field_of_view.material		= HUD_DEBUG_BLACK
		total_field_of_view.h_clip_relation = h_clip_relations.REWRITE_LEVEL
		total_field_of_view.level			= HUD_DEFAULT_LEVEL
		
		total_field_of_view.isdraw			= true
		total_field_of_view.change_opacity	= true
		total_field_of_view.isvisible		= false
		
		total_field_of_view.collimated 		= false
		total_field_of_view.additive_alpha	= true
		total_field_of_view.use_mipfilter	= use_mipfilter
		
	Add(total_field_of_view)

---------------------------------
local init_pos_p_x =  0.585423350 /GetScale() 
local init_pos_p_y = -0.0499138832/GetScale() 

local hardware_glass_base  			  =  CreateElement "ceSimple"
      hardware_glass_base.name		  =  create_guid_string()
	  hardware_glass_base.init_pos	  = {0,-0.50,init_pos_p_x}
      hardware_glass_base.collimated  = false
	  hardware_glass_base.controllers = {{"set_origin_to_cockpit_shape"}}
	  Add(hardware_glass_base)


-- local x_size = 0.95
local y_size = 3

local 	glass     				= CreateElement "ceTexPoly"
		glass.primitivetype 	= "triangles"
		glass.name				= create_guid_string()
		glass.init_pos			= {0,0}
		glass.material      	= HUD_DEBUG_BLACK
		glass.vertices			= {	{-x_size - 0.2, 0.3},
												{ x_size + 0.4, 0.3},
												{ x_size + 0.5,-y_size - 1.4},
												{-x_size - 0.2,-y_size - 1.4},
												
												{-x_size * 0.8, y_size * 0.5},	--4
												{-x_size * 1.1, 0},	
												{ x_size * 0.9, y_size * 0.5},	--6
												{ x_size * 1.1, 0},	
												
												{-x_size * 1.1, y_size * 0.5},	--8
												{0, y_size/2  },
												}
		glass.indices		 	= {0, 1, 2, 	0, 2, 3,	0,4,5,	1,6,7,	4,5,6,	6,7,5,	4,8,9,	6,8,9}  
		glass.init_rot	  		= {0.0, 0.0, -20}
		glass.parent_element    = hardware_glass_base.name
		glass.h_clip_relation	= h_clip_relations.INCREASE_IF_LEVEL
		glass.level	  			= HUD_DEFAULT_LEVEL
		glass.isvisible			= false
		glass.collimated		= false
	-- Add(glass)
 