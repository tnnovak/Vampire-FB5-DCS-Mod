mount_vfs_sound_path 	(current_mod_path.."/Sounds/")

-- Ammunition definition
local HispanoMK5_cartridge_30mm	= 203
local HispanoMK5_link_weight		= 0.09
local tracer_on_time		= 0.02
local barrel_smoke_level	= 0.50
local barrel_smoke_opacity	= 0.10

declare_weapon(
	{
		category				= CAT_SHELLS,
		name					= "HispanoMK5_20x110_HEI_T",
		user_name				= _("OFZT 20x110 HEI-T"),
		model_name				= "tracer_bullet_yellow",
		v0    					= 1780,
		Dv0   					= 0.0050,
		Da0     				= 0.0007,
		Da1     				= 0.0,
		mass      				= 0.403,
		round_mass 				= 0.840 + HispanoMK5_link_weight,	-- round + link
		cartridge_mass			= 0.437 + HispanoMK5_link_weight,	-- cartriges are ejected
		explosive				= 0.43,
		life_time				= 5.0,
		caliber					= 30.0,
		s						= 0.0,
		j						= 0.0,
		l						= 0.0,
		charTime				= 0,
		cx						= {1.0,0.74,0.65,0.150,1.78},
		k1						= 2.3e-08,
		tracer_off				= 1.5,
		tracer_on				= tracer_on_time,
		scale_tracer			= 2,
		scale_smoke				= barrel_smoke_level,
		smoke_opacity			= barrel_smoke_opacity,
		smoke_tail_life_time	= 0.0,
		cartridge				= 0,
	}
)

declare_weapon(
	{
		category				= CAT_SHELLS,
		name					= "HispanoMK5_20x110_APT",
		user_name				= _("BT 20x110 AP-T"),
		model_name				= "tracer_bullet_yellow",
		v0						= 1780,
		Dv0						= 0.0081,			--0.0050,
		Da0						= 0.0005,			--0.0007,
		Da1						= 0.0,
		mass					= 0.403,			
		round_mass				= 0.840 + HispanoMK5_link_weight,	-- round + link
		cartridge_mass			= 0.437 + HispanoMK5_link_weight,	-- cartriges are ejected
		explosive				= 0.300,
		life_time				= 6.0,				--5.0,
		caliber					= 30.0,
		s						= 0.0,
		j						= 0.0,
		l						= 0.0,
		charTime				= 0,
		cx						= {0.5, 0.86, 0.25, 0.236, 2.00},	--{1.0,0.74,0.65,0.150,1.78},
		k1						= 1.2e-08,							--2.3e-08,
		tracer_off				= 1.5,
		tracer_on				= tracer_on_time,
		scale_tracer			= 2,
		scale_smoke				= barrel_smoke_level,
		smoke_opacity			= barrel_smoke_opacity,
		smoke_tail_life_time	= 0.0,
		cartridge				= 0,
	}
)

declare_weapon(
	{
		category				= CAT_SHELLS,
		name					= "HispanoMK5_20x110_APHE",
		user_name				= _("BR 20x110 APHE"),
		model_name				= "tracer_bullet_yellow",
		v0						= 1780,
		Dv0						= 0.0081,			--0.0050,
		Da0						= 0.0005,			--0.0007,
		Da1						= 0.0,
		mass					= 0.403,			
		round_mass				= 0.840 + HispanoMK5_link_weight,	-- round + link
		cartridge_mass			= 0.437 + HispanoMK5_link_weight,	-- cartriges are ejected
		explosive				= 0.43,
		life_time				= 6.0,
		caliber					= 30.0,
		s						= 0.0,
		j						= 0.0,
		l						= 0.0,
		charTime				= 0,
		cx						= {0.5, 0.86, 0.25, 0.236, 2.00},
		k1						= 1.2e-08,
		tracer_off				= 0,
		tracer_on				= 0,	-- No tracers
		scale_tracer			= 2,
		scale_smoke				= barrel_smoke_level,
		smoke_opacity			= barrel_smoke_opacity,
		smoke_tail_life_time	= 0.0,
		cartridge				= 0,
	}
)

-- Guns definition
function HispanoMK5(tbl)

	tbl.category 		= CAT_GUN_MOUNT 
	tbl.name 	 		= "NR-30"
	tbl.display_name	= "NR-30"
	tbl.supply 	 		= 
	{
		mixes  = {
					{2, 3, 1, 1, 1},
					{1},	-- HE-T
					{2},	-- AP-T
					{3},	-- APHE
				}, 
		shells = {
					"HispanoMK5_20x110_HEI_T", 
					"HispanoMK5_20x110_APT",
					"HispanoMK5_20x110_APHE",
				},
		
		count  = 100,
	}
	
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun				= 
	{
		max_burst_length = 400,
		rates 			 = {2400},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {0.0, 0.0, 0.0}
	tbl.ejector_dir 			= tbl.ejector_dir or {-2.0, -2.0, 0.0}
	tbl.supply_position  		= tbl.supply_position or {0,  0, 0}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 2000
	tbl.drop_cartridge 			= HispanoMK5_cartridge_30mm
	tbl.muzzle_pos				= tbl.muzzle_pos or {0,0,0}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial or 0   
	tbl.elevation_initial 		= tbl.elevation_initial or 0   
	if  tbl.effects == nil then
		tbl.effects = 
		{
			{ name = "FireEffect",		arg = tbl.effect_arg_number or 436 },
			{ name = "HeatEffectExt",	shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
			{ name = "NoSmokeEffect"}
		}
	end
	
	return declare_weapon(tbl)
end

declare_loadout(
    {
        category 		= CAT_ROCKETS,
        CLSID	 		= "{British_AP_25LBNo1_3INCHNo1}",
        Count 			= 1
    },
    {
        category 		= CAT_BOMBS,
		CLSID	 		= "{British_GP_500LB_Bomb_Mk1}",		
        -- CLSID	 		= "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
        Count 			= 1
    }
)

-- *************************************************
-- END WEAPONS LOAD
-- *************************************************



VampireFB5 =  {
      
		Name 			= 'Vampire-FB5',
		DisplayName		= _('De Havilland Vampire FB5'),
        Picture 		= "Vampire-FB5.png",
        Rate 			= "50",
        Shape			= "Vampire-FB5",
        WorldID			=  WSTYPE_PLACEHOLDER, 
		--WorldID 		= 6,

		Countries = {"Abkhazia","Australia","Austria","Belarus","Belgium","Brazil","Bulgaria","Canada","China","Croatia",
                 "Czech Republic","Denmark","Egypt","Finland","France","Georgia","Germany","Greece","Hungary",
                 "India","Insurgents","Iran","Iraq","Israel","Italy","Japan","Kazakhstan","The Netherlands","North Korea",
                 "Norway","Pakistan","Poland","Romania","Russia","Saudi Arabia","Serbia","Slovakia","South Korea",
                 "South Ossetia","Spain","Sweden","Switzerland","Syria","Turkey","UK","Ukraine","USA","USAF Aggressors"},		

		binaries =
		{
			'VampireFB5',
		},		
        
		shape_table_data 	= 
		{
			{
				file  	 = 'Vampire-FB5';
				life  	 = 18; -- lifebar
				vis   	 = 3; -- visibility gain.				
				fire  	 = { 300, 2}; -- Fire on the ground after destoyed: 300sec 2m
				username = 'Vampire-FB5';
				index    =  WSTYPE_PLACEHOLDER;
			},
			{
				name  = "Vampire-FB5-collision.edm";
				file  = "Vampire-FB5-collision.edm";
				fire  = { 240, 2};
			},
	
		},
	
	
	mapclasskey 		= "P0091000024",
	attribute  			= {wsType_Air, wsType_Airplane, wsType_Fighter, WSTYPE_PLACEHOLDER ,"Battleplanes",},
	Categories= {"{78EFB7A2-FD52-4b57-A6A6-3BF0E1D6555F}", "Interceptor",},
	
		M_empty						=	3330,	-- kg  with pilot and nose load, F15
		M_nominal					=	4000,	-- kg (Empty Plus Full Internal Fuel)
		M_max						=	5620,	-- kg (Maximum Take Off Weight)
		M_fuel_max					=	600,	-- kg (Internal Fuel Only)
		H_max						=	14300,	-- m  (Maximum Operational Ceiling)
		average_fuel_consumption	=	0.271,
		CAS_min						=	58,		-- Minimum CAS speed (m/s) (for AI)
		V_opt						=	220,	-- Cruise speed (m/s) (for AI)
		V_take_off					=	61,		-- Take off speed in m/s (for AI)
		V_land						=	71,		-- Land speed in m/s (for AI)
		has_afteburner				=	true,
		has_speedbrake				=	true,
		radar_can_see_ground		=	true,
		
		nose_gear_pos                            = {3.31, -1.4, 0}, 
		main_gear_pos                            = {-0.79, -1.4, 1.86}, 
		tand_gear_max                            = 0.554,   -- // tangent on maximum yaw angle of front wheel

		nose_gear_amortizer_direct_stroke        = 0.05,    -- 1.878 - 1.878, -- down from nose_gear_pos !!!
		nose_gear_amortizer_reversal_stroke      = -0.32,   -- 1.348 - 1.878, -- up
		main_gear_amortizer_direct_stroke        = 0.0,     -- 1.592 - 1.592, -- down from main_gear_pos !!!
		main_gear_amortizer_reversal_stroke      = -0.43,   -- 1.192 - 1.592, -- up

		nose_gear_amortizer_normal_weight_stroke = -0.20,   -- 0.144
		main_gear_amortizer_normal_weight_stroke = -0.51,   --

		nose_gear_wheel_diameter                 = 0.441,   -- 0.441, --*
		main_gear_wheel_diameter                 = 0.609,   -- 0.609, --*

		AOA_take_off				=	0.16,	-- AoA in take off (for AI)
		stores_number				=	12,
		bank_angle_max				=	60,		-- Max bank angle (for AI)
		Ny_min						=	-3,		-- Min G (for AI)
		Ny_max						=	8,		-- Max G (for AI)
		V_max_sea_level				=	403,	-- Max speed at sea level in m/s (for AI)
		V_max_h						=	736.11,	-- Max speed at max altitude in m/s (for AI)
		wing_area					=	56.5,	-- wing area in m2
		thrust_sum_max				=	13347,	-- thrust in kgf (64.3 kN)
		thrust_sum_ab				=	21952,	-- thrust in kgf (95.1 kN)
		Vy_max						=	275,	-- Max climb speed in m/s (for AI)
		flaps_maneuver				=	1,
		Mach_max					=	2.5,	-- Max speed in Mach (for AI)
		range						=	2540,	-- Max range in km (for AI)
		RCS							=	5,		-- Radar Cross Section m2
		Ny_max_e					=	8,		-- Max G (for AI)
		detection_range_max			=	250,
		IR_emission_coeff			=	0.91,	-- Normal engine -- IR_emission_coeff = 1 is Su-27 without afterburner. It is reference.
		IR_emission_coeff_ab		=	4,		-- With afterburner
		tand_gear_max				=	3.73,--XX  1.732 FA18 3.73, 
		tanker_type					=	2,--F14=2/S33=4/ M29=0/S27=0/F15=1/ F16=1/To=0/F18=2/A10A=1/ M29K=4/F4=0/
		wing_span					=	13.10,--XX  wing spain in m
		wing_type 					= 	2,-- 0=FIXED_WING/ 1=VARIABLE_GEOMETRY/ 2=FOLDED_WING/ 3=ARIABLE_GEOMETRY_FOLDED
		length						=	19.43,
		height						=	5.63,--XX
		crew_size					=	1, --XX
		engines_count				=	1, --XX
		wing_tip_pos              	= 	{ -4.0,   0.74,   5.3}, 
				
		engines_nozzles = 
		{
			[1] = 
			{
				pos = 	{-1.9, 0, 0}, 
				elevation	=	0,
				diameter	=	0.3,
				exhaust_length_ab	=	0.0,
				exhaust_length_ab_K	=	0.0,
				smokiness_level     = 	5.0, 
			}, -- end of [1]
		}, -- end of engines_nozzles
		crew_members = 
		{
			[1] = 
			{
				ejection_seat_name	=	"vampire_seat",
				pilot_name			= 	"vampire_pilot",
				drop_canopy_name	=	"vampire_canopy";
				pos = 	{6.277,	1.198,	0},
			}, -- end of [1]
		}, -- end of crew_members
		brakeshute_name	=	4,
		is_tanker	=	false,
		air_refuel_receptacle_pos = 	{ -.015,   1.589,   0.00}, 
		fires_pos = 
		{
			[1] = 	{-0.707,	0.553,	-0.213},
			[2] = 	{-0.037,	0.285,	1.391},
			[3] = 	{-0.037,	0.285,	-1.391},
			[4] = 	{-0.82,	0.265,	2.774},
			[5] = 	{-0.82,	0.265,	-2.774},
			[6] = 	{-0.82,	0.255,	4.274},
			[7] = 	{-0.82,	0.255,	-4.274},
			[8] = 	{-5.003,	0.261,	0},
			[9] = 	{-5.003,	0.261,	0},
			[10] = 	{-0.707,	0.453,	1.036},
			[11] = 	{-0.707,	0.453,	-1.036},
		}, -- end of fires_pos
		

        CanopyGeometry 	= {
            azimuth 	= {-145.0, 145.0},-- pilot view horizontal (AI)
            elevation 	= {-50.0, 90.0}-- pilot view vertical (AI)
        },


	HumanRadio = {
		frequency 		= 127.5,  -- Radio Freq
		editable 		= true,
		minFrequency	= 100.000,
		maxFrequency 	= 156.000,
		modulation 		= MODULATION_AM
	},

    LandRWCategories =
    {
        [1] =
        {
            Name = "AircraftCarrier"
        }, 
    }, 

    TakeOffRWCategories =
    {
        [1] =
        {Name = "AircraftCarrier With Catapult"},  		
    }, 

	Guns = {
		HispanoMK5({
			muzzle_pos				= { 2.56, -0.41, 0.35 },
			muzzle_pos_connector	= "GUN_L",
			azimuth_initial			= 0,
			elevation_initial		= -0.7,
			ejector_pos				= { -0.5, 0.0 , 0.0},
		}),	-- LEFT
		
		HispanoMK5({
			muzzle_pos				= {2.56, -0.41, -0.35 },
			muzzle_pos_connector	= "GUN_R",
			azimuth_initial			= 0,
			elevation_initial		= -0.7,
			ejector_pos				= { -0.5, 0.0 ,  0.0},
		}),	-- RIGHT
	},
	
	ammo_type ={
		_("OFZT 20x110 HEI-T"),
		_("BT 20x110 AP-T"),
		_("BR 20x110 APHE"),
	},


	Pylons = {
	 
        pylon(1, 0, 0, 0, 0,			
            {use_full_connector_position=false,},
			{				
				{ CLSID	= "{British_AP_25LBNo1_3INCHNo1}", 
				attach_point_position = {-0.27, -0.23, 1.21}, 
				required ={{station =1, loadout={"{British_AP_25LBNo1_3INCHNo1}"}}},	
				arg_value = -1
				}
			}                                                                          
	 	),		

        pylon(2, 0, 0, 0, 0,			
            {use_full_connector_position=false,},
			{				
				{ CLSID	= "{British_AP_25LBNo1_3INCHNo1}", 
				attach_point_position = {-0.29, -0.29, 0.86}, 
				required ={{station =2, loadout={"{British_AP_25LBNo1_3INCHNo1}"}}},	
				arg_value = -1},			   
				{ CLSID="{British_GP_500LB_Bomb_Mk1}", 
					attach_point_position = {-0.29, -0.40, 0.86}
				}
			}                                                                          
	 	),		

        pylon(3, 0, 0, 0, 0,			
            {use_full_connector_position=false,},
			{				
				{ CLSID	= "{British_AP_25LBNo1_3INCHNo1}", 
				attach_point_position = {-0.29, -0.29, -0.86}, 
				required ={{station =3, loadout={"{British_AP_25LBNo1_3INCHNo1}"}}},	
				arg_value = -1},
				{ CLSID="{British_GP_500LB_Bomb_Mk1}", 
					attach_point_position = {-0.29, -0.40, -0.86}
				}			   
			}                                                                          
	 	),		


        pylon(4, 0, 0, 0, 0,			
            {use_full_connector_position=false,},
			{				
				{ CLSID	= "{British_AP_25LBNo1_3INCHNo1}", 
				attach_point_position = {-0.27, -0.23, -1.21}, 
				required ={{station =4, loadout={"{British_AP_25LBNo1_3INCHNo1}"}}},	
				arg_value = -1}	   
			}                                                                          
	 	)		



    },
	
	Tasks = {
		aircraft_task(GroundAttack),
		aircraft_task(CAS),
		aircraft_task(CAP),
		aircraft_task(Escort),
		aircraft_task(FighterSweep),
		aircraft_task(Intercept),
	},
	DefaultTask = aircraft_task(CAP),

	SFM_Data = {
	aerodynamics = --F15
		{
			Cy0	=	0,
			Mzalfa	=	6,
			Mzalfadt	=	1,
			kjx = 2.95,
			kjz = 0.00125,
			Czbe = -0.016,
			cx_gear = 0.0268,
			cx_flap = 0.06,
			cy_flap = 0.4,
			cx_brk = 0.06,
			table_data = 
			{
			--      M	 Cx0		 Cya		 B		 B4	      Omxmax	Aldop	Cymax
				{0.0,	0.0215,		0.055,		0.08,		0.22,	0.65,	25.0,	1.2 	},
				{0.2,	0.0215,		0.055,		0.08,		0.22,	1.80,	25.0,	1.2     },
				{0.4,	0.0215,		0.055,		0.08,	   	0.22,	3.00,	25.0,	1.2     },
				{0.6,	0.0215,		0.055,		0.05,		0.28,	4.20,	25.0,	1.2     },
				{0.7,	0.0215,		0.055,		0.05,		0.28,	4.20,	23.0,	1.15    },
				{0.8,	0.0215,		0.055,		0.05,		0.28,	4.20,	21.7,	1.1     },
				{0.9,	0.0230,		0.058,		0.09,		0.20,	4.20,	20.1,	1.07    },
				{1.0,	0.0320,		0.062,		0.17,		0.15,	4.20,	18.9,	1.04    },
				{1.1,	0.0430,		0.062,	   	0.235,		0.09,	3.78,	17.4,	1.02    },
				{1.2,	0.0460,		0.062,	   	0.285,		0.08,	2.94,	17.0,	1.00 	},		
				{1.3,	0.0470,		0.06,	   	0.29,		0.10,	2.10,	16.0,	0.92 	},				
				{1.4,	0.0470,		0.056,	   	0.3,		0.136,	1.80,	15.0,	0.80 	},					
				{1.6,	0.0470,		0.052,	   	0.34,		0.21,	1.08,	13.0,	0.7 	},					
				{1.8,	0.0460,		0.042,	   	0.34,		2.43,	0.96,	12.0,	0.55 	},		
				{2.2,	0.0420,		0.037,	   	0.49,		3.5,	0.84,	 10.0,	0.37 	},					
				{2.5,	0.0420,		0.033,		0.6,		4.7,	0.84,	 9.0,	0.3 	},		
				{3.9,	0.0400,		0.023,		0.9,		6.0,	0.84,	 7.0,	0.2		},
			}, -- end of table_data
		}, -- end of aerodynamics
		engine = 
		{
			Nmg	=	67.5,
			MinRUD	=	0,
			MaxRUD	=	1,
			MaksRUD	=	0.85,
			ForsRUD	=	0.91,
			type	=	"TurboJet",
			hMaxEng	=	19.5,
			dcx_eng	=	0.0114,
			cemax	=	1.24,
			cefor	=	2.56,
			dpdh_m	=	6000,
			dpdh_f	=	14000.0,
			table_data = {
			--   M		Pmax		 Pfor
				{0.0,	115000,		212000},
				{0.2,	 94000,		200000},
				{0.4,	 92000,		205000},
				{0.6,	103000,		207000},
				{0.7,	105000,		210000},
				{0.8,	105000,		220000},
				{0.9,	105000,		235000},
				{1.0,	107000,		250000},
				{1.1,	103000,		258000},
				{1.2,	 94000,		268000},
				{1.3,	 84000,		285000},
				{1.4,	 71000,		300000},
				{1.6,	 34000,		318000},
				{1.8,	 19000,		337000},
				{2.2,	 17000,		370000},
				{2.5,	 19000,		390000},
				{3.9,	 82000,		310000},
			}, -- end of table_data
		}, -- end of engine
	},

}

add_aircraft(VampireFB5) 



