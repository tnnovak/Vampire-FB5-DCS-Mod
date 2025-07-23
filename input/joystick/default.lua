local cscripts = folder.."../../Cockpit/Scripts/"
dofile(cscripts.."devices.lua")
dofile(cscripts.."command_defs.lua")

local res = external_profile("Config/Input/Aircrafts/common_joystick_binding.lua")

join(res.keyCommands,{

	{down =Keys.PlaneAirbrake,	name = _('PlaneAirbrake'), 	category = {_('Flight Controls')}},
	{down =Keys.PlaneAirbrakeOn,	name = _('PlaneAirbrakeOn'), 	category = {_('Flight Controls')}},
	{down =Keys.PlaneAirbrakeOff,	name = _('PlaneAirbrakeOff'), 	category = {_('Flight Controls')}},
	{down =Keys.PlaneFireOn,	name = _('PlaneFireOn'), 	category = {_('Weapons')}},
	{down =Keys.PlaneFireOff,	name = _('PlaneFireOff'), 	category = {_('Weapons')}},
	{down =Keys.PlaneGear,	name = _('PlaneGear'), 	category = {_('Flight Controls')}},
	{down =Keys.PlaneGearUp,	name = _('PlaneGearUp'), 	category = {_('Flight Controls')}},
	{down =Keys.PlaneGearDown,	name = _('PlaneGearDown'), 	category = {_('Flight Controls')}},
    {down =Keys.MasterFlightSwitch,	name = _('MasterFlightSwitch'), 	category = {_('Right console')}},
    {down =Keys.GunGyro,	name = _('GunGyro'), 	category = {_('Weapons')}},
    {down =Keys.LandingLights,	name = _('LandingLights'), 	category = {_('Right console')}},    
    {down =Keys.NavigationLights,	name = _('NavigationLights'), 	category = {_('Right console')}},        
    {down =Keys.BatterySwitch,	name = _('BatterySwitch'), 	category = {_('Right console')}},
    {down =Keys.LowPressureFuelCock,	name = _('LowPressureFuelCock'), 	category = {_('Engine')}},
    {down =Keys.HighPressureFuelCock,	name = _('HighPressureFuelCock'), 	category = {_('Engine')}},
    {down =Keys.EngineStartSwitch,	name = _('EngineStartSwitch'), 	category = {_('Right console')}},
    {down =Keys.BoosterPumpSwitch,	name = _('BoosterPumpSwitch'), 	category = {_('Right console')}},
    {down =Keys.GyroSwitch,	name = _('GyroSwitch'), 	category = {_('Right console')}},
    {down =Keys.FlapsOn,	name = _('FlapsOn'), 	category = {_('Flight Controls')}},
    {down =Keys.FlapsOff,	name = _('FlapsOff'), 	category = {_('Flight Controls')}},
    {down =Keys.Gear,	name = _('Gear'), 	category = {_('Flight Controls')}},
    {down =Keys.LeftGearBrakeShort,	name = _('LeftGearBrakeShort'), 	category = {_('Controls')}},
    {down =Keys.LeftGearBrakeLong,	name = _(''), 	category = {_('Controls')}},
    {down =Keys.RightGearBrakeShort,	name = _('LeftGearBrakeLong'), 	category = {_('Controls')}},
    {down =Keys.RightGearBrakeLong,	name = _('RightGearBrakeLong'), 	category = {_('Controls')}},
    {down =Keys.Brakes,	name = _('Brakes'), 	category = {_('Controls')}},
    {down =Keys.WeaponsMaterSwitch,	name = _('WeaponsMaterSwitch'), 	category = {_('Right console')}},
    {down =Keys.GunSafetySwitch,	name = _('GunSafetySwitch'), 	category = {_('Weapons')}},
    {down =Keys.GunSightSwitch,	name = _('GunSightSwitch'), 	category = {_('Weapons')}},
    {down =Keys.RocketBombSelectorSwitch,	name = _('RocketBombSelectorSwitch'), 	category = {_('Weapons')}},
    {down =Keys.RocketModeSwitch,	name = _('RocketModeSwitch'), 	category = {_('Weapons')}},
    {down =Keys.BombFuseSwitch,	name = _('BombFuseSwitch'), 	category = {_('Weapons')}},
    {down =Keys.PickleButton,	name = _('PickleButton'), 	category = {_('Right console')}},
    {down =Keys.PitchTrimDown,	name = _('PitchTrimDown'), 	category = {_('Flight Controls')}},
    {down =Keys.PitchTrimUp ,	name = _('PitchTrimUp'), 	category = {_('Flight Controls')}},   
    {down =Keys.GunSightMoveUp,	name = _('GunSightMoveUp'), 	category = {_('Weapons')}},
    {down =Keys.GunSightMoveDown,	name = _('GunSightMoveDown'), 	category = {_('Weapons')}},
    {down =Keys.GunSightMoveLeft,	name = _('GunSightMoveLeft'), 	category = {_('Weapons')}},
    {down =Keys.GunSightMoveRight,	name = _('GunSightMoveRight'), 	category = {_('Weapons')}},
    {down =Keys.GunSightSizeMode,	name = _('GunSightSizeMode'), 	category = {_('Weapons')}},
    {down =Keys.CockpitLightsOnOff,	name = _('CockpitLightsOnOff'), 	category = {_('Right console')}},
	{down =Keys.CanopyOpenClose,	name = _('CanopyOpenClose'), 	category = {_('Right console')}},
	
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


