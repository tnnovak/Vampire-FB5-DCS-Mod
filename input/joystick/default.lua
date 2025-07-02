local cscripts = folder.."../../Cockpit/Scripts/"
dofile(cscripts.."devices.lua")
dofile(cscripts.."command_defs.lua")

local res = external_profile("Config/Input/Aircrafts/common_joystick_binding.lua")

join(res.keyCommands,{

	{combos = {{key = 'JOY_BTN1', }}, down 	= 7000,  name = _('Fire rockets'),               category = {_('Weapons')}},
	{combos = {{key = 'JOY_BTN2'}}, down 	= 7001,        name = _('Master Arm'),              category = {_('Weapons')}},
    {combos = {{key = 'JOY_BTN3'}}, down 	= 7002,        name = _('Salvo Mode'),              category = {_('Weapons')}},
	
})

-- joystick axes 
join(res.axisCommands,{

    {combos = defaultDeviceAssignmentFor("roll"),   action = iCommandPlaneRoll,                                                             name = _('Roll'),              category = {_('Flight Control')}},
    {combos = defaultDeviceAssignmentFor("pitch"),  action = iCommandPlanePitch,                                                            name = _('Pitch'),             category = {_('Flight Control')}},
	{combos = defaultDeviceAssignmentFor("rudder"), action = iCommandPlaneRudder,																	name = _('Rudder'),            category = {_('Flight Control')}},
	{combos = defaultDeviceAssignmentFor("thrust"), action = iCommandPlaneThrustCommon,    														name = _('Thrust'),            category = {_('Flight Control')}},
	
	---------------------------------------------
	-- Systems ----------------------------------
	---------------------------------------------
	{action = iCommandWheelBrake,		name = _('Wheel Brake'),		category = {_('Systems')}},
	{action = iCommandLeftWheelBrake,	name = _('Wheel Brake Left'),	category = {_('Systems')}},
	{action = iCommandRightWheelBrake,	name = _('Wheel Brake Right'),	category = {_('Systems')}},
})
return res