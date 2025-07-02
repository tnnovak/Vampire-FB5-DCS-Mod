local self_ID  = "Vampire-FB5 by Toni Novak - toninovak@gmail.com" 

declare_plugin(self_ID,
{
displayName		= _("Vampire-FB5"),
developerName= _("T.N."),
installed 	 = true,  
dirName	  	 = current_mod_path,
version		 = "1.0.0.0",            
state		 = "installed",
info		 = _("Vampire-FB5"),

binaries	 =
	{ 
		'VampireFB5',
	},
Skins	=
	{
		{
			name	= _("Vampire-FB5"),
			dir		= "Theme"
		},
	},
Missions =
	{
		{
			name		= _("Vampire-FB5"),
			dir			= "Missions",
		},
	},
LogBook =
	{
		{
			name		= _("Vampire-FB5"),
			type		= "Vampire-FB5",
		},
	},	
	InputProfiles =
	{
		["Vampire-FB5"]     = current_mod_path .. '/Input',
	},

})

local FM =
{

	[1] = "Vampire-FB5 by Toni Novak - toninovak@gmail.com",
	[2] = "Vampire-FB5",
	center_of_mass = { 0, 0 , 0.0}, -- center of mass position relative to object 3d model center for empty aircraft
	moment_of_inertia = {31000, 100000, 30000, -1500}, -- moment of inertia of empty (Ixx,Iyy,Izz,Ixy)	in kgm^2	

	suspension 			= {
		{--Nose wheel
		   mass = 100,
			damage_element = 0, 
			self_attitude = true,
			wheel_axle_offset = 0.14,
			yaw_limit = math.rad(70.0),
			damper_coeff = 400.0, 
			allowable_hard_contact_length	= 0.19,				

			 amortizer_max_length     = 0.53,
			 amortizer_basic_length   = 0.53,
			 amortizer_reduce_length  = 0.53, --0.43
			 
			 amortizer_spring_force_factor   = 990000.0, -- force = spring_force_factor * pow(reduce_length, amortizer_spring_force_factor_rate
			 amortizer_spring_force_factor_rate  = 1,
			 amortizer_static_force     = 47500.0,
			 
			 amortizer_direct_damper_force_factor = 50000,
			 amortizer_back_damper_force_factor  = 60000,

			 anti_skid_installed = true,

			 wheel_radius      = 0.64,
			 wheel_static_friction_factor  = 0.75 ,
			 -- wheel_side_friction_factor    = 0.85,--0.85 ,
			 wheel_roll_friction_factor    = 0.08 ,
			 wheel_glide_friction_factor   = 0.65 ,
			 wheel_damage_force_factor     = 450.0,
			 
			   wheel_moment_of_inertia   = 0.15, --wheel moi as rotation body

			   wheel_brake_moment_max = 0.0, -- maximum value of braking moment  , N*m 
			   
			   arg_post			  = 0,
			   arg_amortizer		  = 1,
			   arg_wheel_rotation    = 76,
			   arg_wheel_yaw		  = 2,
			   collision_shell_name  = "WHEEL_F",
				arg_wheel_damage   = 134,
		   },
	   {--Left wheel
	   mass = 200,
	   damage_element	    = 3,
	   wheel_axle_offset 	= 0.38,
	   self_attitude	    = false,
	   yaw_limit		    = math.rad(0.0),
	   damper_coeff	    = 160.0,
	   
		 amortizer_max_length     = 0.1  , 
		 amortizer_basic_length   = 0.1  ,
		 amortizer_reduce_length  = 0.1  ,
		 
		 amortizer_spring_force_factor   = 29370398.0, -- 10000 -- force = spring_force_factor * pow(reduce_length, amortizer_spring_force_factor_rate
		 amortizer_spring_force_factor_rate  = 3,
		 amortizer_static_force     = 202394.0, 
		 amortizer_direct_damper_force_factor = 150000.0,
		 amortizer_back_damper_force_factor  = 125000.0,
		 
		 amortizer_direct_damper_force_factor = 50000,
		 amortizer_back_damper_force_factor  = 60000,

	   allowable_hard_contact_length			= 0.25,
	   anti_skid_installed = true,
	   wheel_roll_friction_factor     = 0.20,-- DO NOT activate, already implemented in EFM code
	   wheel_damage_speed			   = 180,
	   wheel_moment_of_inertia  	   = 0.6, --wheel moi as rotation body
		wheel_radius      = 0.94,
		 wheel_static_friction_factor  = 0.75 ,
		 wheel_side_friction_factor    = 1.0,--0.85 ,
		 wheel_roll_friction_factor    = 0.08 ,
		 wheel_glide_friction_factor   = 0.65 ,
		 wheel_damage_force_factor     = 450.0,
	   wheel_brake_moment_max 			= 15000.0, -- maximum value of braking moment  , N*m 
	   
	   arg_post			  = 5,
	   arg_amortizer		  = 6,
	   arg_wheel_rotation    = 77,
	   arg_wheel_yaw		  = -1,
	   collision_shell_name  = "WHEEL_L",
	   arg_wheel_damage   = 136
   },
	   {-- Right wheel
		   mass = 200,
	   damage_element	    = 3,
	   wheel_axle_offset 	= 0.38,
	   self_attitude	    = false,
	   yaw_limit		    = math.rad(0.0),
	   damper_coeff	    = 160.0,
	   
		 amortizer_max_length     = 0.1  , 
		 amortizer_basic_length   = 0.1  ,
		 amortizer_reduce_length  = 0.1  ,
		 
		 amortizer_spring_force_factor   = 29370398.0, -- 10000 -- force = spring_force_factor * pow(reduce_length, amortizer_spring_force_factor_rate
		 amortizer_spring_force_factor_rate  = 3,
		 amortizer_static_force     = 202394.0, 
		 amortizer_direct_damper_force_factor = 150000.0,
		 amortizer_back_damper_force_factor  = 125000.0,
		 
		 amortizer_direct_damper_force_factor = 50000,
		 amortizer_back_damper_force_factor  = 60000,

	   allowable_hard_contact_length			= 0.25,
	   anti_skid_installed = true,
	   wheel_roll_friction_factor     = 0.20,-- DO NOT activate, already implemented in EFM code
	   wheel_damage_speed			   = 180,
	   wheel_moment_of_inertia  	   = 0.6, --wheel moi as rotation body
	   
	   
		wheel_radius      = 0.94,
		 wheel_static_friction_factor  = 0.75 ,
		 wheel_side_friction_factor    = 1.0,--0.85 ,
		 wheel_roll_friction_factor    = 0.08 ,
		 wheel_glide_friction_factor   = 0.65 ,
		 wheel_damage_force_factor     = 450.0,
	   wheel_brake_moment_max 			= 15000.0, -- maximum value of braking moment  , N*m 
			   
		   arg_post			  = 3,
		   arg_amortizer		  = 4,
		   arg_wheel_rotation    = 77,
		   arg_wheel_yaw		  = -1,
		   collision_shell_name  = "WHEEL_R",
	   },
   }, -- gears

}

mount_vfs_sound_path (current_mod_path.."/Sounds/")

--------------------------------------------------------------------------------
mount_vfs_model_path   (current_mod_path.."/Shapes")  
mount_vfs_liveries_path (current_mod_path.."/Liveries")
mount_vfs_texture_path  (current_mod_path.."/Textures/")

 
dofile(current_mod_path.."/Vampire-FB5.lua")
dofile(current_mod_path.."/Views.lua")

--With EFM DLL
make_flyable('Vampire-FB5',current_mod_path..'/Cockpit/Scripts/', FM, nil)

make_view_settings('Vampire-FB5', ViewSettings, SnapViews)
---------------------------------------------------------------------------------------

-- make_flyable('Vampire-FB5', current_mod_path..'/Cockpit/Scripts/', { nil, }, current_mod_path..'/comm.lua')

plugin_done()