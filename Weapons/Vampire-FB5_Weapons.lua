mount_vfs_model_path    (current_mod_path .. "/Weapons/Shapes")
mount_vfs_texture_path  (current_mod_path .. "/Weapons/Textures/Vampire-FB5_Weapons_textures")


local tracer_on_time = 2.0
local barrel_smoke_level = 1.0
local barrel_smoke_opacity = 0.1

-- Weapon declarations
---------------------------------------------------------

local R_3S1 = {
	category		= CAT_AIR_TO_AIR,
	name			= "R-3S1",  
	user_name		= _("R-3S1"),
	model			= "R-3S_1",
	wsTypeOfWeapon 	= {wsType_Weapon,wsType_Missile,wsType_AA_Missile,WSTYPE_PLACEHOLDER},
	Escort = 0,
	Head_Type = 1,
	sigma = {3, 3, 3},
	M = 85.73,
	H_max = 18000.0,
	H_min = -1,
	Diam = 127.0,
	Cx_pil = 1.88,
	D_max = 7000.0,
	D_min = 300.0,
	Head_Form = 0,
	Life_Time = 60.0,
	Nr_max = 40,
	v_min = 140.0,
	v_mid = 350.0,
	Mach_max = 2.7,
	t_b = 0.0,
	t_acc = 5.0,
	t_marsh = 0.0,
	Range_max = 14000.0,
	H_min_t = 1.0,
	Fi_start = 0.3,
	Fi_rak = 3.14152,
	Fi_excort = 0.79,
	Fi_search = 0.09,
	OmViz_max = 0.61,
	warhead = simple_aa_warhead(11.0),
	exhaust = { 0.7, 0.7, 0.7, 1.0 },
	X_back = -1.66,
	Y_back = 0.0,
	Z_back = 0.0,
	Reflection = 0.03,
	KillDistance = 7.0,
	--seeker sensivity params
	SeekerSensivityDistance = 20000, -- The range of target with IR value = 1. In meters. In forward hemisphere.
	ccm_k0 = 0.75,  -- Counter Countermeasures Probability Factor. Value = 0 - missile has absolutely resistance to countermeasures. Default = 1 (medium probability)
	SeekerCooled			= true, -- True is cooled seeker and false is not cooled seeker.			
	shape_table_data =
	{
		{
			name	 = "R-3S1",
			file	 = "R-3S_1",
			life	 = 1,
			fire	 = { 0, 1},
			username = _("R-3S1"),
			index = WSTYPE_PLACEHOLDER,
		},
	},
	supersonic_A_coef_skew = 0.25, -- наклон прямой коэффициента отвала поляры на сверхзвуке
	nozzle_exit_area =	0.0068, -- площадь выходного сечения сопла

	ModelData = {
		58,  -- model params count
		0.35,   -- characteristic square (характеристическая площадь)

		-- параметры зависимости Сx
		0.049, -- Cx_k0 планка Сx0 на дозвуке ( M << 1)
		0.082, -- Cx_k1 высота пика волнового кризиса
		0.010, -- Cx_k2 крутизна фронта на подходе к волновому кризису
		0.001, -- Cx_k3 планка Cx0 на сверхзвуке ( M >> 1)
		0.550, -- Cx_k4 крутизна спада за волновым кризисом 
		0.8, -- коэффициент отвала поляры (пропорционально sqrt (M^2-1))

		-- параметры зависимости Cy
		2.5, -- Cy_k0 планка Сy0 на дозвуке ( M << 1)
		0.8, -- Cy_k1 планка Cy0 на сверхзвуке ( M >> 1)
		1.2, -- Cy_k2 крутизна спада(фронта) за волновым кризисом  

		0.13, -- 7 Alfa_max  максимальный балансировачный угол, радианы
		0.00, --угловая скорость создаваймая моментом газовых рулей

	-- Engine data. Time, fuel flow, thrust.	
	--	t_statr		t_b		t_accel		t_march		t_inertial		t_break		t_end			-- Stage
		-1.0,	   -1.0,	5.20,  		0.0,		0.0,			0.0,		1.0e9,         -- time of stage, sec
			0.0,		0.0,	5.27,		0.0,		0.0,			0.0,		0.0,           -- fuel flow rate in second, kg/sec(секундный расход массы топлива кг/сек)
			0.0,		0.0,	11890.0,	0.0,		0.0,			0.0,		0.0,           -- thrust, newtons

		1.0e9, -- таймер самоликвидации, сек
		60.0, -- время работы энергосистемы, сек
		0, -- абсолютная высота самоликвидации, м
		0.3, -- время задержки включения управления (маневр отлета, безопасности), сек
		1.0e9, -- дальность до цели в момент пуска, при превышении которой ракета выполняется маневр "горка", м
		1.0e9, -- дальность до цели, при которой маневр "горка" завершается и ракета переходит на чистую пропорциональную навигацию (должен быть больше или равен предыдущему параметру), м 
		0.0,  -- синус угла возвышения траектории набора горки
		30.0, -- продольное ускорения взведения взрывателя
		0.0, -- модуль скорости сообщаймый катапультным устройством, вышибным зарядом и тд
		1.19, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K0
		1.0, -- характристика системы САУ-РАКЕТА,  коэф фильтра второго порядка K1
		2.0, -- характристика системы САУ-РАКЕТА,  полоса пропускания контура управления
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		-- DLZ. Данные для рассчета дальностей пуска (индикация на прицеле)
		26800.0, -- дальность ракурс   180(навстречу) град,  Н=10000м, V=900км/ч, м
		11400.0, -- дальность ракурс 0(в догон) град,  Н=10000м, V=900км/ч, м
		13300.0, -- дальность ракурс 	180(навстречу) град, Н=1000м, V=900км/ч, м
		0.2, -- Уменьшение разрешенной дальности пуска при отклонении вектора скорости носителя от линии визирования цели.
		1.0, -- Вертикальная плоскость. Наклон кривой разрешенной дальности пуска в нижнюю полусферу. Уменьшение дальности при стрельбе вниз.
		1.4, -- Вертикальная плоскость. Наклон кривой разрешенной дальности пуска в верхнюю полусферу. Увеличение дальности при стрельбе вверх.
		-3.0, -- Вертикальная плоскость. Угол перегиба кривой разрешенной дальности, верхняя - нижняя полусфера.
		0.5, -- Изменение коэффициентов наклона кривой в верхнюю и нижнюю полусферы от высоты носителя.
	},
}

declare_weapon(R_3S1)

-- Already declared by MiG-19P
-- declare_weapon({category = CAT_SHELLS, name = "N37_37x155_HEI_T",
-- 	user_name					= _("N37_37x155_HEI_T"),
-- 	model_name					= "tracer_bullet_crimson",
-- 	v0							= 690,
-- 	Dv0							= 0.0060,
-- 	Da0							= 0.0017,
-- 	Da1							= 0.0,
-- 	mass						= 0.722,
-- 	round_mass					= 1.250+0.115,		-- round + link
-- 	cartridge_mass				= 0.0,				-- 0.413+0.115, cartridges are ejected
-- 	explosive					= 0.410,
-- 	life_time					= 5.0,
-- 	caliber						= 37.0,
-- 	s							= 0.0,
-- 	j							= 0.0,
-- 	l							= 0.0,
-- 	charTime					= 0,
-- 	cx							= {0.5,0.80,0.90,0.080,2.15},
-- 	k1							= 5.7e-09,
-- 	tracer_off					= 1.5,
-- 	tracer_on					= tracer_on_time,
-- 	scale_tracer				= 2,
-- 	scale_smoke					= 2.0,
-- 	smoke_tail_life_time		= 1.0,
-- 	cartridge					= 0,
-- 	visual_effect_correction	= 3.0,
-- })

-- Already declared by MiG-19P
-- declare_weapon({category = CAT_SHELLS, name = "N37_37x155_API_T",
-- 	user_name					= _("N37_37x155_API_T "),
-- 	model_name					= "tracer_bullet_crimson",
-- 	v0							= 675,
-- 	Dv0							= 0.0060,
-- 	Da0							= 0.0017,
-- 	Da1							= 0.0,
-- 	mass						= 0.765,
-- 	round_mass					= 1.294+0.115,		-- round + link
-- 	cartridge_mass				= 0.0,				-- 0.413+0.115, cartridges are ejected
-- 	explosive					= 0.410,
-- 	life_time					= 5.0,
-- 	caliber						= 37.0,
-- 	s							= 0.0,
-- 	j							= 0.0,
-- 	l							= 0.0,
-- 	charTime					= 0,
-- 	cx							= {0.5,0.80,0.90,0.080,2.15},
-- 	k1							= 5.7e-09,
-- 	tracer_off					= 1.5,
-- 	tracer_on					= tracer_on_time,
-- 	scale_smoke					= 2.0,
-- 	smoke_tail_life_time		= 1.0,
-- 	cartridge					= 0,
-- 	visual_effect_correction	= 3.0,
-- })

-- Already declared by MiG-19P
-- declare_weapon({category = CAT_SHELLS, name = "NR23_23x115_HEI_T",
-- 	user_name				= _("NR23_23x115_HEI_T"),
-- 	model_name				= "tracer_bullet_crimson",
-- 	v0						= 680,
-- 	Dv0						= 0.0050,
-- 	Da0						= 0.0007,
-- 	Da1						= 0.0,
-- 	mass					= 0.196,
-- 	round_mass				= 0.340+0.071,		-- round + link
-- 	cartridge_mass			= 0.0,				-- 0.111+0.071, cartridges are ejected
-- 	explosive				= 0.011,
-- 	life_time				= 5.0,
-- 	caliber					= 23.0,
-- 	s						= 0.0,
-- 	j						= 0.0,
-- 	l						= 0.0,
-- 	charTime				= 0,
-- 	cx						= {1.0,0.74,0.65,0.150,1.78},
-- 	k1						= 2.3e-08,
-- 	tracer_off				= 1.5,
-- 	tracer_on		 		= tracer_on_time,
-- 	scale_smoke				= 2.0,
-- 	smoke_tail_life_time	= 1.0,
-- 	cartridge				= 0,
-- 	scale_smoke				= barrel_smoke_level,
-- 	smoke_opacity			= barrel_smoke_opacity,
-- })

-- Already declared by MiG-19P
-- declare_weapon({category = CAT_SHELLS, name = "NR23_23x115_API",
-- 	user_name				= _("NR23_23x115_API"),
-- 	model_name				= "tracer_bullet_crimson",
-- 	v0						= 680,
-- 	Dv0						= 0.0050,
-- 	Da0						= 0.0007,
-- 	Da1						= 0.0,
-- 	mass					= 0.199,
-- 	round_mass				= 0.340+0.071,		-- round + link
-- 	cartridge_mass			= 0.0,				-- 0.111+0.071, cartridges are ejected
-- 	explosive				= 0.000,
-- 	life_time				= 5.0,
-- 	caliber					= 37.0,
-- 	s						= 0.0,
-- 	j						= 0.0,
-- 	l						= 0.0,
-- 	charTime				= 0,
-- 	cx						= {1.0,0.74,0.65,0.150,1.78},
-- 	k1						= 2.3e-08,
-- 	tracer_off				= -1,
-- 	tracer_on				= tracer_on_time,
-- 	scale_tracer			= 2,
-- 	scale_smoke				= 2.0,
-- 	smoke_tail_life_time	= 1.0,
-- 	cartridge				= 0,
-- })

-- Weapon functions
---------------------------------------------------------

function nr23(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "NR-23"
	tbl.display_name	= "NR-23"
	tbl.supply 	 = 
	{
		shells = {"NR23_23x115_HEI_T","NR23_23x115_API"},
		mixes  = {{1,2,2,1,2,2}}, --  
		count  = 80,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 80,
		rates 			 = {850},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,2,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 204		-- shell_50cal
	tbl.muzzle_pos				= {0,0,0}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

function n37(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "N-37"
	tbl.display_name	= "N-37"
	tbl.supply 	 = 
	{
		shells = {"N37_37x155_HEI_T", "N37_37x155_API_T"},
		mixes  = {{1,1,1,2}}, --  Calculated by weight (55 kg)
		count  = 40,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 40,
		rates 			 = {400},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-0.4, -1.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,3,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 203		-- shell_30mm
	tbl.muzzle_pos				= {0,0,0}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

function NR23_1(tbl)
	tbl.category = CAT_GUN_MOUNT
	tbl.name = "NR23_1"
	tbl.supply = 
	{
		shells = {"NR23_23x115_HEI_T","NR23_23x115_API"},
		mixes  = {{1,2,2,1,2,2}}, --  
		count  = 80,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 80,
		rates 			 = {670},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-2.0, -0.2, -0.2}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,2,-1}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 204		-- shell_50cal
	tbl.muzzle_pos				= {4.0, -0.52, -0.38}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

function NR23_2(tbl)
	tbl.category = CAT_GUN_MOUNT
	tbl.name = "NR23_2"
	tbl.supply = 
	{
		shells = {"NR23_23x115_HEI_T","NR23_23x115_API"},
		mixes  = {{1,2,2,1,2,2}}, --  
		count  = 80,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 80,
		rates 			 = {635},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-2.0, -0.2, -0.2}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,2,-1}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 204		-- shell_50cal
	tbl.muzzle_pos				= {3.5, -0.63, -0.28}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

function N37(tbl)

	tbl.category = CAT_GUN_MOUNT 
	tbl.name 	 = "N37"
	tbl.supply 	 = 
	{
		shells = {"N37_37x155_HEI_T", "N37_37x155_API_T"},
		mixes  = {{1,1,1,2}}, --  Calculated by weight (55 kg)
		count  = 40,
	}
	if tbl.mixes then 
	   tbl.supply.mixes =  tbl.mixes
	   tbl.mixes	    = nil
	end
	tbl.gun = 
	{
		max_burst_length = 40,
		rates 			 = {390},
		recoil_coeff 	 = 1,
		barrels_count 	 = 1,
	}
	if tbl.rates then 
	   tbl.gun.rates    =  tbl.rates
	   tbl.rates	    = nil
	end	
	tbl.ejector_pos 			= tbl.ejector_pos or {-2.0, -0.2, 0.18}
	tbl.ejector_dir 			= tbl.ejector_dir or {0,3,0}
	tbl.supply_position  		= tbl.supply_position   or {0,  0.3, -0.3}
	tbl.aft_gun_mount 			= false
	tbl.effective_fire_distance = 1000
	tbl.drop_cartridge 			= 203		-- shell_30mm
	tbl.muzzle_pos				= {3.75, -0.63, 0.28}	-- all position from connector
	tbl.azimuth_initial 		= tbl.azimuth_initial    or 0   
	tbl.elevation_initial 		= tbl.elevation_initial  or 0   
	if  tbl.effects == nil then
		tbl.effects = {{ name = "FireEffect"     , arg 		 = tbl.effect_arg_number or 436 },
					   { name = "HeatEffectExt"  , shot_heat = 7.823, barrel_k = 0.462 * 2.7, body_k = 0.462 * 14.3 },
					   { name = "SmokeEffect"}}
	end
	return declare_weapon(tbl)
end

-- Loadout declarations
---------------------------------------------------------

declare_loadout({
		category		= CAT_ROCKETS,
		CLSID			= "{UB_16_57}",
		displayName		= _("UB-16-57"),
		wsTypeOfWeapon	= {4, 7, 33, 31},
		attribute		= {4, 7, 32, WSTYPE_PLACEHOLDER},
		Count			= 16,
		Picture			= "UB16-57.png",
		Weight_Empty	= 57 ,
		Weight			= (16 * 3.99) + 57,
		Cx_pil			= 0.001,
		shape_table_data = 
		{
			{
				name		= "UB-16-57",
				file		= "UB-16-57";
				life		= 1;
				fire		= {0, 1};
				username	= "UB-16-57";
				index		= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	=
				{
					{
						ShapeName	=	"UB-16-57",
						IsAdapter 	= true
					}, 
						{Position	=	{0,	-0.134,      0} ,ShapeName	=	"s-5m_1",}, --1
						{Position	=	{0,	-0.175, -0.057} ,ShapeName	=	"s-5m_1",}, --2
						{Position	=	{0,	-0.175, 0.057}  ,ShapeName	=	"s-5m_1",}, --3
						{Position	=	{0,	-0.241, -0.035} ,ShapeName	=	"s-5m_1",}, --4
						{Position	=	{0,	-0.241, 0.035}  ,ShapeName	=	"s-5m_1",}, --5

						{Position	=	{0,	-0.065, -0.055},ShapeName	=	"s-5m_1",}, --1
						{Position	=	{0,	-0.065,  0.055},ShapeName	=	"s-5m_1",}, --2

						{Position	=	{0,	-0.113, -0.112} ,ShapeName	=	"s-5m_1",}, --3
						{Position	=	{0,	-0.113,  0.112} ,ShapeName	=	"s-5m_1",}, --4

						{Position	=	{0,	-0.183, -0.139} ,ShapeName	=	"s-5m_1",}, --5
						{Position	=	{0,	-0.183,  0.139} ,ShapeName	=	"s-5m_1",}, --6

						{Position	=	{0,	-0.257, -0.125} ,ShapeName	=	"s-5m_1",}, --7
						{Position	=	{0,	-0.257,  0.125} ,ShapeName	=	"s-5m_1",}, --1

						{Position	=	{0,	-0.311, -0.074} ,ShapeName	=	"s-5m_1",}, --2
						{Position	=	{0,	-0.311,  0.074} ,ShapeName	=	"s-5m_1",}, --3

						{Position	=	{0,	-0.333,      0} ,ShapeName	=	"s-5m_1",}, --4
				}, -- end of Elements
})

-- Already declared by MiG-19P
-- declare_loadout({
-- 	category			= CAT_ROCKETS,
-- 	CLSID				= "{ORO57K_S5M_HEFRAG}",
-- 	displayName			= _("ORO-57K - S-5M x 8"),
-- 	wsTypeOfWeapon		= {4, 7, 33, 31},			-- S-5 FFAR
-- 	attribute			= {4, 7, 32, WSTYPE_PLACEHOLDER},
-- 	Count				= 8,
-- 	Picture				= "b13.png",
-- 	Weight_Empty		= 33,
-- 	Weight				= (8 * 3.99) + 33,
-- 	Cx_pil				= 0.001,
-- 	shape_table_data = {
-- 		{
-- 			name		= "ORO57K_S5M_HEFRAG",
-- 			file		= "ORO57K_S5M_HEFRAG";
-- 			life		= 1;
-- 			fire		= {0, 1};
-- 			username	= "ORO57K_S5M_HEFRAG";
-- 			index		= WSTYPE_PLACEHOLDER;
-- 		},
-- 	},
-- 	Elements = {{ ShapeName = "oro-57k.edm", IsAdapter = true}}
-- })

declare_loadout({
		category	= CAT_FUEL_TANKS,
		CLSID		= "VampireFB5_R_PTB400",
		attribute	=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture		= "PTB.png",
		displayName	= _("Fuel Tank 400 liters"),
		Weight_Empty	= 32.0,
		Weight		= 32.0 + 400*0.83, -- 0.83 is L to KG conv from system details
		Cx_pil		= 0.001313754,
		shape_table_data = 
		{
			{
				name	= "VampireFB5_R_PTB400";
				file	= "VampireFB5_R_PTB400";
				life	= 1;
				fire	= { 0, 1};
				username	= "VampireFB5_R_PTB400";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			{
				ShapeName	= "VampireFB5_R_PTB400",
			}, 
		}, 
})

declare_loadout({
		category	= CAT_FUEL_TANKS,
		CLSID		= "VampireFB5_L_PTB400",
		attribute	=  {wsType_Air,wsType_Free_Fall,wsType_FuelTank,WSTYPE_PLACEHOLDER},
		Picture		= "PTB.png",
		displayName	= _("Fuel Tank 400 liters"),
		Weight_Empty	= 32.0,
		Weight		= 32.0 + 400*0.83, -- 0.83 is L to KG conv from system details
		Cx_pil		= 0.001313754,
		shape_table_data = 
		{
			{
				name	= "VampireFB5_L_PTB400";
				file	= "VampireFB5_L_PTB400";
				life	= 1;
				fire	= { 0, 1};
				username	= "VampireFB5_L_PTB400";
				index	= WSTYPE_PLACEHOLDER;
			},
		},
		Elements	= 
		{
			{
				ShapeName	= "VampireFB5_L_PTB400",
			}, 
		}, 
})

-- AIM-9C R-3S (AA-2 Atoll)
local R3S_DRAG	= 2.58 / 4096.0 -- 4096 - magic number from long time ago when flanker was 1.5

declare_loadout({
		category			= 	CAT_AIR_TO_AIR,
		CLSID 				= 	"{R-3S_1}",
		Picture				=	"aim9p.png",
		displayName			=	_("R-3S1"),
		NatoName			=	"{AA-2}",
		-- attribute			=	R_3S1.wsTypeOfWeapon,
		-- attribute			=	{4,	4,	7, WSTYPE_PLACEHOLDER},
		attribute			=	{4,	4,	32,	WSTYPE_PLACEHOLDER},
		wsTypeOfWeapon		= 	R_3S1.wsTypeOfWeapon,
		Cx_pil				=	R3S_DRAG,
		Count				=	1,
		Weight				=	90.0,
		Elements			=  {{ShapeName = "R-3S_1"}}-- end of Elements
})

