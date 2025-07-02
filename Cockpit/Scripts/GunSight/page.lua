dofile(LockOn_Options.common_script_path.."elements_defs.lua")

SetScale(METERS) -- Use meters for world alignment

function AddGSTexture(name,file,lower_vis,upper_vis, size)     

    local gsight_mat = MakeMaterial(file, {255,255,255,255})
    local sight = CreateElement "ceTexPoly"
    sight.name = name
    sight.material = gsight_mat  
    sight.init_pos = {0, 0, 0} 
    sight.vertices = {{-size,  size},{ size,  size},{ size, -size},{-size, -size}}
    sight.indices = {0, 1, 2, 0, 2, 3}
    sight.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
    sight.collimated = true
    sight.use_mipfilter = true
    sight.additive_alpha = true
    sight.h_clip_relation = h_clip_relations.REWRITE_LEVEL
    sight.level = DEFAULT_LEVEL
    sight.element_params	= {"GUNSIGHT_VPOS","GUNSIGHT_HPOS","GUNSIGHT_VIS"}
    sight.controllers	= {	
        {"move_up_down_using_parameter", 0, 1.0 },
        {"move_left_right_using_parameter", 1, 1.0 },
        {"parameter_in_range", 2, lower_vis, upper_vis}
    }	
    Add(sight)

end    

local GS_VIS = get_param_handle("GUNSIGHT_VIS")
GS_VIS:set(1.5) -- Default visibility of the gun sight

AddGSTexture("sight1",LockOn_Options.script_path.."../Textures/gsight.png",1,2,0.05)
AddGSTexture("sight2",LockOn_Options.script_path.."../Textures/gsight.png",2,3,0.048)
AddGSTexture("sight3",LockOn_Options.script_path.."../Textures/gsight.png",3,4,0.046)
AddGSTexture("sight4",LockOn_Options.script_path.."../Textures/gsight.png",4,5,0.044)
AddGSTexture("sight5",LockOn_Options.script_path.."../Textures/gsight.png",5,6,0.042)
AddGSTexture("sight6",LockOn_Options.script_path.."../Textures/gsight.png",6,7,0.040)
AddGSTexture("sight7",LockOn_Options.script_path.."../Textures/gsight.png",7,8,0.038)
AddGSTexture("sight8",LockOn_Options.script_path.."../Textures/gsight.png",8,9,0.036)
AddGSTexture("sight9",LockOn_Options.script_path.."../Textures/gsight.png",9,10,0.034)














