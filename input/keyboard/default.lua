
local res = external_profile("Config/Input/Aircrafts/base_keyboard_binding.lua")
-- dofile(LockOn_Options.script_path.."command_defs.lua")

dofile("C:/Users/tonin/Saved Games/DCS.openbeta/Mods/Aircraft/Vampire-FB5/Cockpit/Scripts/command_defs.lua")

join(res.keyCommands,{

-- Electric / Instruments
    {combos = {{key = '1', reformers={'LCtrl'}}},          down = Keys.MasterFlightSwitch, name = _('Master Flight Switch'), category = _('Electric / Instruments')},
    {combos = {{key = '2', reformers={'LCtrl'}}},          down = Keys.GunGyro, name = _('Gun Gyro'), category = _('Electric / Instruments')},
    {combos = {{key = '3', reformers={'LCtrl'}}},          down = Keys.StaticPressureHeater, name = _('Static pressure heater'), category = _('Electric / Instruments')},
    {combos = {{key = '4', reformers={'LCtrl'}}},          down = Keys.LandingLights, name = _('Landing lights'), category = _('Electric / Instruments')},
    {combos = {{key = '5', reformers={'LCtrl'}}},          down = Keys.TSIndicatorSwitch, name = _('TSIndicator switch'), category = _('Electric / Instruments')},
    {combos = {{key = '6', reformers={'LCtrl'}}},          down = Keys.NavigationLights, name = _('Navigation lights'), category = _('Electric / Instruments')},
    {combos = {{key = '7', reformers={'LCtrl'}}},          down = Keys.AttitudeIndicatorSwitch, name = _('Attitude Indicator switch'), category = _('Electric / Instruments')},
    {combos = {{key = '8', reformers={'LCtrl'}}},          down = Keys.CanopyHeaterSwitch, name = _('Canopy heater switch'), category = _('Electric / Instruments')},

-- Fuel
    {combos = {{key = '1', reformers={'LAlt'}}},           down = Keys.LowPressureFuelCock, name = _('Low pressure fuel cock'), category = _('Fuel')},
    {combos = {{key = '2', reformers={'LAlt'}}},           down = Keys.HighPressureFuelCock, name = _('High pressure fuel cock'), category = _('Fuel')},

-- Engine
    {combos = {{key = '3', reformers={'LAlt'}}},           down = Keys.EngineStartSwitch, name = _('Engine start switch'), category = _('Engine')},

-- Hydraulic
    {combos = {{key = 'F'}},                               down = Keys.FlapsOn, name = _('Flaps ON'), category = _('Hydraulic')},
    {combos = {{key = 'F', reformers={'LCtrl'}}},          down = Keys.FlapsOff, name = _('Flaps OFF'), category = _('Hydraulic')},

-- Gear
    {combos = {{key = 'G', reformers={'LAlt'}}},           down = Keys.Gear, name = _('Gear'), category = _('Gear')},

-- Pneumatic

    -- {combos = {{key = 'A', reformers={'LAlt'}}},           down = Keys.LeftGearBrakeShort, name = _('Left gear brake Short'), category = _('Pneumatic')},
    {combos = {{key = 'S', reformers={'LAlt'}}},           down = Keys.Brakes, name = _('Brakes'), category = _('Pneumatic')},

    {combos = {{key = 'A', reformers={'LCtrl'}}},          down = Keys.LeftGearBrakeLong, up = Keys.LeftGearBrakeLong, name = _('Left gear brake Long'), category = _('Pneumatic')},
    {combos = {{key = 'S', reformers={'LCtrl'}}},          down = Keys.RightGearBrakeLong, up = Keys.RightGearBrakeLong, name = _('Right gear brake Long'), category = _('Pneumatic')},

    -- {combos = {{key = 'T'}},                                down = Keys.Brakes, name = _('Brakes'), category = _('Pneumatic')},


-- Weapons
    {combos = {{key = '5', reformers={'LAlt'}}},           down = Keys.BombSelectorSwitch, name = _('Bomb selector switch'), category = _('Weapons')},
    {combos = {{key = '6', reformers={'LAlt'}}},           down = Keys.ExternalGunSelectorSwitch, name = _('External gun selector switch'), category = _('Weapons')},
    {combos = {{key = '7', reformers={'LAlt'}}},           down = Keys.BombsForwardFusingSwitch, name = _('Bombs forward fusing switch'), category = _('Weapons')},
    {combos = {{key = '8', reformers={'LAlt'}}},           down = Keys.InternalGunSwitch, name = _('Internal Gun switch'), category = _('Weapons')},
    {combos = {{key = '9', reformers={'LAlt'}}},           down = Keys.BombsSalvoModeSwitch, name = _('Bombs salvo mode switch'), category = _('Weapons')},
    {combos = {{key = '0', reformers={'LAlt'}}},           down = Keys.BombsRearFusingSwitch, name = _('Bombs rear fusing switch'), category = _('Weapons')},

-- Flight Controls
    {combos = {{key = '.'}},                                down = Keys.PitchTrimDown, name = _('Pitch trim down'), category = _('Flight Controls')},
    {combos = {{key = ','}},                                down = Keys.PitchTrimUp, name = _('Pitch trim up'), category = _('Flight Controls')},

    {combos = {{key = "Z"}},								down = Keys.RudderLeft, up = Keys.RudderLeft, name=_('Flight Rudder Left'),category=_('Flight Controls')},
    {combos = {{key = "X"}},								down = Keys.RudderRight, up = Keys.RudderRight, name=_('Flight Rudder Right'),category=_('Flight Controls')},

-- Weapons

    {combos = {{key = "Space", reformers={'LAlt'}}},		down = Keys.PickleButton, name=_('Pickle Button'),category=_('Weapons')},

-- Debug Aero
    {combos = {{key = '.', reformers={'LCtrl'}}},           down = Keys.SMPlus, name = _('SM +'), category = _('Flight Controls')},
    {combos = {{key = ',', reformers={'LCtrl'}}},           down = Keys.SMMinus, name = _('SM -'), category = _('Flight Controls')},
    {combos = {{key = '/', reformers={'RCtrl'}}},           down = Keys.RMPlus, name = _('RM +'), category = _('Flight Controls')},
    {combos = {{key = ',', reformers={'RCtrl'}}},           down = Keys.RMMinus, name = _('RM -'), category = _('Flight Controls')},
    {combos = {{key = '.', reformers={'LAlt'}}},            down = Keys.DMPlus, name = _('DM +'), category = _('Flight Controls')},
    {combos = {{key = ',', reformers={'LAlt'}}},            down = Keys.DMMinus, name = _('DM -'), category = _('Flight Controls')},

-- Help    
    
    {combos = {{key = 'S', reformers={'LShift'}}},            down = Keys.StickHideShow, name = _('Show / Hide Stick'), category = _('Helper Functions')},
    {combos = {{key = 'D', reformers={'LCtrl'}}},            down = Keys.ShowHideDebugScreen, name = _('Show / Hide Debug'), category = _('Helper Functions')},

-- Gun Sight
    
    {combos = {{key = 'I', reformers={'LCtrl'}}},            down = Keys.GunSightMoveUp, name = _('Gun Sight Move Up'), category = _('Gun Sight')},
    {combos = {{key = 'M', reformers={'LCtrl'}}},            down = Keys.GunSightMoveDown, name = _('Gun Sight Move Down'), category = _('Gun Sight')},
    {combos = {{key = 'J', reformers={'LCtrl'}}},            down = Keys.GunSightMoveLeft, name = _('Gun Sight Move Left'), category = _('Gun Sight')},    
    {combos = {{key = 'K', reformers={'LCtrl'}}},            down = Keys.GunSightMoveRight, name = _('Gun Sight Move Right'), category = _('Gun Sight')},    

-- Cockpit

    {combos = {{key = 'C', reformers={'LCtrl'}}},            down = Keys.CanopyOpenClose, name = _('Canopy Open/Close'), category = _('Cockpit')},

})

return res