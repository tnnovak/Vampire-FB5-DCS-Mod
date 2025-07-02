dofile(LockOn_Options.common_script_path.."elements_defs.lua")

SetCustomScale(1.0)

function AddElement(object)
	object.screenspace = ScreenType.SCREENSPACE_TRUE
    object.use_mipfilter = true
    Add(object)
end

function AddText(label,font,param,base_name,x,y,prec,str)

	local txt = CreateElement "ceStringPoly"
	txt.material = font
	txt.init_pos = { x , y }
	txt.alignment = "LeftCenter"
	txt.stringdefs = { 0.0025, 0.0007, 0, 0 }
	txt.use_mipfilter = true
	txt.h_clip_relation = h_clip_relations.COMPARE
	txt.level = DEFAULT_LEVEL
	-- txt.value = "TEST text"
	txt.formats = {tostring(label).." = %-2."..tostring(prec).."f "..tostring(str),"%s"}
	txt.element_params = {tostring(param)}
	txt.controllers = {{"text_using_parameter",0,0}}
	txt.parent_element	= base_name
	AddElement(txt) 
	
end


local pitch_stick_real_range	= 9.03125
local pitch_stick_part_positive	= (5)/(5+17)
local pitch_stick_part_negative	= (17)/(5+17)
local roll_stick_real_range		= 11.875
local roll_stick_part_left		= 0.5
local roll_stick_part_right		= 0.5

local throttleMil				= 0.8

local aspect			= LockOn_Options.screen.aspect
local size_x			= 0.15	-- +-size_x
local size_y_positive	= size_x * 2.0 * pitch_stick_real_range / roll_stick_real_range * pitch_stick_part_positive
local size_y_negative	= size_x * 2.0 * pitch_stick_real_range / roll_stick_real_range * pitch_stick_part_negative
local tex_scale			= 0.25/size_x
local line_width		= (4.5/512)/tex_scale * 0.3


local roll_stick_movement           = 140
local k                             = size_x / roll_stick_movement
local pitch_stick_movement_positive = 0.76 * roll_stick_movement * 0.625 * k
local pitch_stick_movement_negative = 0.76 * roll_stick_movement * 0.375 * k
--[[
    CURR_SCREENSPACE_NONE = 0,
    CURR_SCREENSPACE_HUD_ONLY_VIEW = 1,
    CURR_SCREENSPACE_ARCADE = 2,
--]]

local ds				= 0.05 * size_x
local rud_shift			= 2*0.1*size_x
local rud_base_shift	= rud_shift --0.05*size_x
local rudder_shift		= 0.1*size_x

local orange_mat		= MakeMaterial("", {255, 100, 0, 50})
local green_mat		= MakeMaterial("", {0, 255, 0, 50})

-- font_Bold_Arial_white
-- font_dejavu_lgc_sans_condensed_17

local FONT = MakeFont({ used_DXUnicodeFontData = "font_dejavu_lgc_sans_condensed_15" }, { 255, 255, 255, 255 }) 

-- BASE -----------------------------------------------------------------------

local MFD_size = 0.9;
local half_size = MFD_size / 2

local x_init = -0.9
local y_init = -0.5

base				= CreateElement "ceMeshPoly"
base.name			= "base"
base.primitivetype	= "triangles"
base.material		= green_mat 
base.init_pos		= {x_init,y_init}
base.vertices		= {
	{-half_size,	half_size},
	{half_size/2,		half_size},
	{half_size/2,		-half_size},
	{-half_size,		-half_size}
}
base.indices		= default_box_indices
base.element_params	= {"PARAM_ShowDebugScreen"}
base.controllers	= {{"parameter_in_range", 0, 0.9, 1.1}}
base.h_clip_relation	= h_clip_relations.REWRITE_LEVEL
base.level			= DEFAULT_LEVEL
AddElement(base)

-- Weapons ----------------------------------------------------------------------

WS_IR_MISSILE_LOCK = get_param_handle("WS_IR_MISSILE_LOCK")
WS_IR_MISSILE_TARGET_AZIMUTH = get_param_handle("WS_IR_MISSILE_TARGET_AZIMUTH")
WS_IR_MISSILE_TARGET_ELEVATION = get_param_handle("WS_IR_MISSILE_TARGET_ELEVATION")

-- DATA ----------------------------------------------------------------------

local text_x_align = -0.29
local text_x_align2 = -0.0

local text_y_align = 0.29

local delta_y = 0.025

-- column 1 

AddText("V", FONT, "PARAM_VKmh", base.name, text_x_align , text_y_align - (1 * delta_y),1,"MPH")
AddText("G", FONT, "PARAM_G", base.name, text_x_align , text_y_align - (2 * delta_y),2,"")
--AddText("ACCX", FONT, "PARAM_ACCX", base.name, text_x_align , text_y_align - (2 * delta_y),3,"m/s2")
AddText("AOA", FONT, "PARAM_AOA", base.name, text_x_align , text_y_align - (3 * delta_y),1,"Deg")
-- AddText("Pitch", FONT, "PARAM_Pitch", base.name, text_x_align , text_y_align - (4 * delta_y),1,"deg") 
AddText("Mach", FONT, "PARAM_Mach", base.name, text_x_align , text_y_align - (4 * delta_y),2,"") 
AddText("L/W", FONT, "PARAM_LW", base.name, text_x_align , text_y_align - (5 * delta_y),2,"") 

--AddText("ALT", FONT, "PARAM_ALT", base.name, text_x_align , text_y_align - (6 * delta_y),1,"feet")
--AddText("Climb", FONT, "PARAM_EngineStartTimerState", base.name, text_x_align , text_y_align - (7 * delta_y),1,"feet/min")

AddText("ETCount", FONT, "PARAM_EngineStartTimerCount", base.name, text_x_align , text_y_align - (6 * delta_y),1,"")
AddText("ETState", FONT, "PARAM_EngineStartTimerState", base.name, text_x_align , text_y_align - (7 * delta_y),1,"")

AddText("Fuel Flow", FONT, "PARAM_FuelFlow", base.name, text_x_align , text_y_align - (9 * delta_y),5,"GL/sec")
AddText("Fus tank", FONT, "PARAM_FFFus", base.name, text_x_align , text_y_align - (10 * delta_y),5,"GL")
AddText("Left tank", FONT, "PARAM_FFLeft", base.name, text_x_align , text_y_align - (11 * delta_y),5,"GL")
AddText("Right tank", FONT, "PARAM_FFRight", base.name, text_x_align , text_y_align - (12 * delta_y),5,"GL")

--AddText("CT", FONT, "PARAM_CLT", base.name, text_x_align , text_y_align - (8 * delta_y),5,"")
--AddText("CL", FONT, "PARAM_CL", base.name, text_x_align , text_y_align - (9 * delta_y),5,"")
--AddText("C0", FONT, "PARAM_CL0", base.name, text_x_align , text_y_align - (10 * delta_y),5,"")
--AddText("CD", FONT, "PARAM_CD", base.name, text_x_align , text_y_align - (11 * delta_y),5,"")
--AddText("Mach", FONT, "PARAM_Mach", base.name, text_x_align , text_y_align - (12 * delta_y),2,"")


AddText("Trim", FONT, "PARAM_Trim", base.name, text_x_align , text_y_align - (14 * delta_y),1,"N.m")
AddText("S.M.", FONT, "PARAM_SM", base.name, text_x_align , text_y_align - (15 * delta_y),5,"m")
AddText("KCMRest", FONT, "PARAM_RM", base.name, text_x_align , text_y_align - (16 * delta_y),5,"")
AddText("Cmq", FONT, "PARAM_DM", base.name, text_x_align , text_y_align - (17 * delta_y),5,"")

AddText("Yaw", FONT, "PARAM_Yaw", base.name, text_x_align , text_y_align - (19 * delta_y),1,"Deg")
AddText("Roll", FONT, "PARAM_Roll", base.name, text_x_align , text_y_align - (20 * delta_y),1,"Deg")

AddText("FLAPS", FONT, "PARAM_FLAPS", base.name, text_x_align , text_y_align - (22 * delta_y),2,"")
AddText("Gear", FONT, "PARAM_Gear", base.name, text_x_align , text_y_align - (23 * delta_y),2,"")

AddText("RPM", FONT, "PARAM_RPM", base.name, text_x_align , text_y_align - (25 * delta_y),1,"")
AddText("Thrust", FONT, "PARAM_Thrust", base.name, text_x_align , text_y_align - (26 * delta_y),1,"N")
AddText("Drag", FONT, "PARAM_Drag", base.name, text_x_align , text_y_align - (27 * delta_y),1,"N")
AddText("Eng Temp", FONT, "PARAM_EngTemp", base.name, text_x_align , text_y_align - (28 * delta_y),1,"C.")
AddText("Fuel Flow", FONT, "PARAM_FuelFlow", base.name, text_x_align , text_y_align - (29 * delta_y),5,"Kg/sec")



-- column 2

--AddText("E1 RPM", FONT, "PARAM_E2RPM", base.name, text_x_align2 , text_y_align - (0 * delta_y),0,"%%")
--AddText("E2 RPM", FONT, "PARAM_E1RPM", base.name, text_x_align2 , text_y_align - (1 * delta_y),0,"%%")
--AddText("Lift Load", FONT, "PARAM_LIFTLOAD", base.name, text_x_align2 , text_y_align - (2 * delta_y),1,"")
--AddText("TD Ratio", FONT, "PARAM_TDRATIO", base.name, text_x_align2 , text_y_align - (3 * delta_y),1,"")

--AddText("AOA", FONT, "PARAM_AOA", base.name, text_x_align2 , text_y_align - (5 * delta_y),1,"Dg")
--AddText("Gs", FONT, "PARAM_Gs", base.name, text_x_align2 , text_y_align - (6 * delta_y),1,"")

--AddText("MS LOCK", FONT, "WS_IR_MISSILE_LOCK", base.name, text_x_align2 , text_y_align - (8 * delta_y),5,"")
--AddText("MS Tg AZ", FONT, "WS_IR_MISSILE_TARGET_AZIMUTH", base.name, text_x_align2 , text_y_align - (9 * delta_y),5,"")
--AddText("MS Tg EL", FONT, "WS_IR_MISSILE_TARGET_ELEVATION", base.name, text_x_align2 , text_y_align - (10 * delta_y),5,"")

--AddText("E1 Thrust", FONT, "PARAM_Thrust1", base.name, text_x_align2 , text_y_align - (12 * delta_y),1,"N")
--AddText("E2 Thrust", FONT, "PARAM_Thrust2", base.name, text_x_align2 , text_y_align - (13 * delta_y),1,"N")



-- STICK ----------------------------------------------------------------------
local stick_index_size = 0.1 * size_x
stick_position				= CreateElement "ceTexPoly"
stick_position.name			= "stick_position"
stick_position.vertices		= {	{-stick_index_size, -stick_index_size},
								{-stick_index_size,  stick_index_size},
								{ stick_index_size,  stick_index_size},
								{ stick_index_size, -stick_index_size}}
stick_position.indices		= default_box_indices
stick_position.material		= MakeMaterial("", {255, 0, 0, 125})
-- stick_position.tex_params	= {330/512, 365.5 / 512, 2*tex_scale, 2*tex_scale/0.8}
stick_position.init_pos = { 0 , 0 }
stick_position.element_params	= {	"STICK_PITCH", "STICK_BANK" }
stick_position.controllers	= {
	{"move_up_down_using_parameter", 0, -0.3 },
	{"move_left_right_using_parameter", 1, -0.3 }
}
stick_position.parent_element	= base.name

AddElement(stick_position)

--[[

Params list

PARAM_Mach
PARAM_TAS
PARAM_IAS
PARAM_SAS
PARAM_SV
PARAM_Heading
PARAM_MagHead
PARAM_SideSlip
PARAM_Roll
PARAM_Pitch
PARAM_TotalFuel
PARAM_AOA
PARAM_Takeoff
PARAM_TouchdownPARAM16.parameter_name   = PARAM_LiftLoad
PARAM_GroundStop
PARAM_Throttle
PARAM_RALT
PARAM_Lift
PARAM_Drag
PARAM_Thrust
PARAM_TDR
PARAM_PitchMoment
PARAM_StaticMargin

]]

--AddText("CL", FONT, "PARAM_CL", base.name, text_x_align , text_y_align - (8 * delta_y),5,"")
--AddText("CD", FONT, "PARAM_CD", base.name, text_x_align , text_y_align - (9 * delta_y),5,"")




