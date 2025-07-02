shape_name   	   = "Cockpit_Vampire-FB5"
is_EDM			   = true
new_model_format   = true
simplify_cockpit = false
draw_old_cockpit = false

ambient_light    = {50,50,50}
ambient_color_day_texture    = {100, 100, 100}
ambient_color_night_texture  = {40, 60 ,150}
ambient_color_from_devices   = {50, 50, 40}
ambient_color_from_panels	 = {35, 25, 25}

dusk_border					 = 0.4
draw_pilot					 = false

use_external_views = false

day_texture_set_value   = 0.0
night_texture_set_value = 0.1
render_target_always = true

cockpit_local_point = {1.3, 0.71, 0.0} 


args_initial_state = 
{
	[887] = 0.0,	
}

render_target_always = true

local controllers = LoRegisterPanelControls()
function post_initialize()
end

-- ****************************************************
-- Avionics

Compass = CreateGauge("parameter")
Compass.parameter_name = "INST_Compass"
Compass.arg_number = 730
Compass.input = {-1.0, 1.0}
Compass.output = {-1.0, 1.0}

-- Altimeter small
ALT1 = CreateGauge("parameter")
ALT1.parameter_name = "INST_ALT1"
ALT1.arg_number = 1020
ALT1.input = {-1.0, 1.0}
ALT1.output = {-1.0, 1.0}

-- Altimeter medium
ALT2 = CreateGauge("parameter")
ALT2.parameter_name = "INST_ALT2"
ALT2.arg_number = 1000
ALT2.input = {-1.0, 1.0}
ALT2.output = {-1.0, 1.0}

-- Altimeter long
ALT3 = CreateGauge("parameter")
ALT3.parameter_name = "INST_ALT3"
ALT3.arg_number = 980
ALT3.input = {-1.0, 1.0}
ALT3.output = {-1.0, 1.0}

Climb = CreateGauge("parameter")
Climb.parameter_name = "INST_Climb"
Climb.arg_number = 960
Climb.input = {-1.0, 1.0}
Climb.output = {-1.0, 1.0}

Clock1 = CreateGauge("parameter")
Clock1.parameter_name = "INST_Clock1"
Clock1.arg_number = 900
Clock1.input = {-1.0, 1.0}
Clock1.output = {-1.0, 1.0}

Clock2 = CreateGauge("parameter")
Clock2.parameter_name = "INST_Clock2"
Clock2.arg_number = 920
Clock2.input = {-1.0, 1.0}
Clock2.output = {-1.0, 1.0}

Clock3 = CreateGauge("parameter")
Clock3.parameter_name = "INST_Clock3"
Clock3.arg_number = 940
Clock3.input = {-1.0, 1.0}
Clock3.output = {-1.0, 1.0}

TSIndicator = CreateGauge("parameter")
TSIndicator.parameter_name = "INST_TSIndicator"
TSIndicator.arg_number = 1140
TSIndicator.input = {-1.0, 1.0}
TSIndicator.output = {-1.0, 1.0}

EGT = CreateGauge("parameter")
EGT.parameter_name = "INST_EGT"
EGT.arg_number = 1860
EGT.input = {-1.0, 1.0}
EGT.output = {-1.0, 1.0}

RPM1 = CreateGauge("parameter")
RPM1.parameter_name = "INST_RPM1"
RPM1.arg_number = 820
RPM1.input = {-1.0, 1.0}
RPM1.output = {-1.0, 1.0}

RPM2 = CreateGauge("parameter")
RPM2.parameter_name = "INST_RPM2"
RPM2.arg_number = 840
RPM2.input = {-1.0, 1.0}
RPM2.output = {-1.0, 1.0}

Speed = CreateGauge("parameter")
Speed.parameter_name = "INST_Speed"
Speed.arg_number = 800
Speed.input = {-1.0, 1.0}
Speed.output = {-1.0, 1.0}

Turn = CreateGauge("parameter")
Turn.parameter_name = "INST_Turn"
Turn.arg_number = 1040
Turn.input = {-1.0, 1.0}
Turn.output = {-1.0, 1.0}

Voltage = CreateGauge("parameter")
Voltage.parameter_name = "INST_Voltage"
Voltage.arg_number = 700
Voltage.input = {-1.0, 1.0}
Voltage.output = {-1.0, 1.0}

HorizonRoll = CreateGauge("parameter")
HorizonRoll.parameter_name = "INST_HorizonRoll"
HorizonRoll.arg_number = 760
HorizonRoll.input = {-1.0, 1.0}
HorizonRoll.output = {-1.0, 1.0}

HorizonVert = CreateGauge("parameter")
HorizonVert.parameter_name = "INST_HorizonVert"
HorizonVert.arg_number = 750
HorizonVert.input = {-1.0, 1.0}
HorizonVert.output = {-1.0, 1.0}

Gmeter = CreateGauge("parameter")
Gmeter.parameter_name = "INST_Gmeter"
Gmeter.arg_number = 860
Gmeter.input = {-1.0, 1.0}
Gmeter.output = {-1.0, 1.0}

-- ****************************************************
-- Tanks

FusTank = CreateGauge("parameter")
FusTank.parameter_name = "INST_FusTank"
FusTank.arg_number = 1880
FusTank.input = {-1.0, 1.0}
FusTank.output = {-1.0, 1.0}

RightWingTank = CreateGauge("parameter")
RightWingTank.parameter_name = "INST_RightWingTank"
RightWingTank.arg_number = 1820
RightWingTank.input = {-1.0, 1.0}
RightWingTank.output = {-1.0, 1.0}

LeftWingTank = CreateGauge("parameter")
LeftWingTank.parameter_name = "INST_LeftWingTank"
LeftWingTank.arg_number = 1780
LeftWingTank.input = {-1.0, 1.0}
LeftWingTank.output = {-1.0, 1.0}

LeftTipTank = CreateGauge("parameter")
LeftTipTank.parameter_name = "INST_LeftTipTank"
LeftTipTank.arg_number = 1760
LeftTipTank.input = {-1.0, 1.0}
LeftTipTank.output = {-1.0, 1.0}

RightTipTank = CreateGauge("parameter")
RightTipTank.parameter_name = "INST_RightTipTank"
RightTipTank.arg_number = 1840
RightTipTank.input = {-1.0, 1.0}
RightTipTank.output = {-1.0, 1.0}

-- end tanks

-- ****************************************************
-- Throttle and levers

Throttle = CreateGauge("parameter")
Throttle.parameter_name = "INST_Throttle"
Throttle.arg_number = 1080
Throttle.input = {-1.0, 1.0}
Throttle.output = {-1.0, 1.0}

Flaps = CreateGauge("parameter")
Flaps.parameter_name = "INST_Flaps"
Flaps.arg_number = 1740
Flaps.input = {-1.0, 1.0}
Flaps.output = {-1.0, 1.0}

GearLever = CreateGauge("parameter")
GearLever.parameter_name = "INST_GearLever"
GearLever.arg_number = 2000
GearLever.input = {-1.0, 1.0}
GearLever.output = {-1.0, 1.0}

PitchTrimWheel = CreateGauge("parameter")
PitchTrimWheel.parameter_name = "INST_PitchTrimWheel"
PitchTrimWheel.arg_number = 1230
PitchTrimWheel.input = {-1.0, 1.0}
PitchTrimWheel.output = {-1.0, 1.0}

-- ****************************************************
-- Pressure gauges

-- left side (difficult to see)

UpperLeftPress = CreateGauge("parameter")
UpperLeftPress.parameter_name = "INST_UpperLeftPress"
UpperLeftPress.arg_number = 1680
UpperLeftPress.input = {-1.0, 1.0}
UpperLeftPress.output = {-1.0, 1.0}

LowerLeftPress = CreateGauge("parameter")
LowerLeftPress.parameter_name = "INST_LowerLeftPress"
LowerLeftPress.arg_number = 1100
LowerLeftPress.input = {-1.0, 1.0}
LowerLeftPress.output = {-1.0, 1.0}

-- easy visible

OilPress = CreateGauge("parameter")
OilPress.parameter_name = "INST_OilPress"
OilPress.arg_number = 720
OilPress.input = {-1.0, 1.0}
OilPress.output = {-1.0, 1.0}

-- right side

UpperRightPress = CreateGauge("parameter")
UpperRightPress.parameter_name = "INST_UpperRightPress"
UpperRightPress.arg_number = 880
UpperRightPress.input = {-1.0, 1.0}
UpperRightPress.output = {-1.0, 1.0}

-- ****************************************************
-- Fuel Cocks

HighPressureFuelCock = CreateGauge("parameter")
HighPressureFuelCock.parameter_name = "INST_HighPressureFuelCock"
HighPressureFuelCock.arg_number = 1120
HighPressureFuelCock.input = {-1.0, 1.0}
HighPressureFuelCock.output = {-1.0, 1.0}

LowPressureFuelCock = CreateGauge("parameter")
LowPressureFuelCock.parameter_name = "INST_LowPressureFuelCock"
LowPressureFuelCock.arg_number = 2010
LowPressureFuelCock.input = {-1.0, 1.0}
LowPressureFuelCock.output = {-1.0, 1.0}

-- ****************************************************
-- Stick and pedal Controls

StickPitch = CreateGauge("parameter")
StickPitch.parameter_name = "INST_StickPitch"
StickPitch.arg_number = 1180
StickPitch.input = {-1.0, 1.0}
StickPitch.output = {-1.0, 1.0}

SitckRoll = CreateGauge("parameter")
SitckRoll.parameter_name = "INST_StickRoll"
SitckRoll.arg_number = 1210
SitckRoll.input = {-1.0, 1.0}
SitckRoll.output = {-1.0, 1.0}

StickRoll = CreateGauge("parameter")
StickRoll.parameter_name = "INST_StickRoll"
StickRoll.arg_number = 1160
StickRoll.input = {-1.0, 1.0}
StickRoll.output = {-1.0, 1.0}

StickHide = CreateGauge("parameter")
StickHide.parameter_name = "INST_StickHide"
StickHide.arg_number = 2020
StickHide.input = {-1.0, 1.0}
StickHide.output = {-1.0, 1.0}

PedalYaw = CreateGauge("parameter")
PedalYaw.parameter_name = "INST_PedalYaw"
PedalYaw.arg_number = 1060
PedalYaw.input = {-1.0, 1.0}
PedalYaw.output = {-1.0, 1.0}

-- ****************************************************
-- Switches

MasterFlightSwitch = CreateGauge("parameter")
MasterFlightSwitch.parameter_name = "INST_MasterFlightSwitch"
MasterFlightSwitch.arg_number = 1960
MasterFlightSwitch.input = {-1.0, 1.0}
MasterFlightSwitch.output = {-1.0, 1.0}

-- Start Switch
StarterButton = CreateGauge("parameter")
StarterButton.parameter_name = "INST_StarterButton"
StarterButton.arg_number = 1900
StarterButton.input = {-1.0, 1.0}
StarterButton.output = {-1.0, 1.0}

-- Booster Pump Switch
Switch1_001 = CreateGauge("parameter")
Switch1_001.parameter_name = "INST_Switch1.001"
Switch1_001.arg_number = 1910
Switch1_001.input = {0.0, 1.0}
Switch1_001.output = {0.0, 1.0}

-- Gyro Switch
Switch1_002 = CreateGauge("parameter")
Switch1_002.parameter_name = "INST_Switch1.002"
Switch1_002.arg_number = 1920
Switch1_002.input = {0.0, 1.0}
Switch1_002.output = {0.0, 1.0}

-- Master Arm
Switch1_003 = CreateGauge("parameter")
Switch1_003.parameter_name = "INST_Switch1.003"
Switch1_003.arg_number = 1930
Switch1_003.input = {0.0, 1.0}
Switch1_003.output = {0.0, 1.0}

-- Bomb / Rockets
Switch1_004 = CreateGauge("parameter")
Switch1_004.parameter_name = "INST_Switch1.004"
Switch1_004.arg_number = 1940
Switch1_004.input = {0.0, 1.0}
Switch1_004.output = {0.0, 1.0}

-- Salvo Mode
Switch1_005 = CreateGauge("parameter")
Switch1_005.parameter_name = "INST_Switch1.005"
Switch1_005.arg_number = 1950
Switch1_005.input = {0.0, 1.0}
Switch1_005.output = {0.0, 1.0}

-- Not used
Switch1_006 = CreateGauge("parameter")
Switch1_006.parameter_name = "INST_Switch1.006"
Switch1_006.arg_number = 1960
Switch1_006.input = {0.0, 1.0}
Switch1_006.output = {0.0, 1.0}

-- Battery Switch
Switch1_008 = CreateGauge("parameter")
Switch1_008.parameter_name = "INST_Switch1.008"
Switch1_008.arg_number = 3160
Switch1_008.input = {0.0, 1.0}
Switch1_008.output = {0.0, 1.0}

-- GunSIght Switch
Switch1_009 = CreateGauge("parameter")
Switch1_009.parameter_name = "INST_Switch1.009"
Switch1_009.arg_number = 3170
Switch1_009.input = {0.0, 1.0}
Switch1_009.output = {0.0, 1.0}

-- Cockpit Light Switch
Switch1_011 = CreateGauge("parameter")
Switch1_011.parameter_name = "INST_Switch1.011"
Switch1_011.arg_number = 3180
Switch1_011.input = {0.0, 1.0}
Switch1_011.output = {0.0, 1.0}

-- Navigation Lights
Switch1_012 = CreateGauge("parameter")
Switch1_012.parameter_name = "INST_Switch1.012"
Switch1_012.arg_number = 3190
Switch1_012.input = {0.0, 1.0}
Switch1_012.output = {0.0, 1.0}


TrimIndicator = CreateGauge("parameter")
TrimIndicator.parameter_name = "INST_TrimIndicator"
TrimIndicator.arg_number = 1980
TrimIndicator.input = {-1.0, 1.0}
TrimIndicator.output = {-1.0, 1.0}

-- ****************************************************
-- Lights (4 principals)

-- Principais:
-- 1. Generator warning light 01 - 3000
-- 2. Fuel pressure warning light 05 - 3040
-- 3. cockpit pressure warning light 06 - 3050
-- 4. wheels not locked warning light 04 - 3030
-- Fire warning 02 - 3010 (nao utlizada)

GeneratorWarningLight = CreateGauge("parameter")
GeneratorWarningLight.parameter_name = "INST_GeneratorWarningLight"
GeneratorWarningLight.arg_number = 3000
GeneratorWarningLight.input = {-1.0, 1.0}
GeneratorWarningLight.output = {-1.0, 1.0}

FuelPressureWarningLight = CreateGauge("parameter")
FuelPressureWarningLight.parameter_name = "INST_FuelPressureWarningLight"
FuelPressureWarningLight.arg_number = 3040
FuelPressureWarningLight.input = {-1.0, 1.0}
FuelPressureWarningLight.output = {-1.0, 1.0}

CockpitPressureWarningLight = CreateGauge("parameter")
CockpitPressureWarningLight.parameter_name = "INST_CockpitPressureWarningLight"
CockpitPressureWarningLight.arg_number = 3050
CockpitPressureWarningLight.input = {-1.0, 1.0}
CockpitPressureWarningLight.output = {-1.0, 1.0}

WheelsNotLockedWarningLight = CreateGauge("parameter")
WheelsNotLockedWarningLight.parameter_name = "INST_WheelsNotLockedWarningLight"
WheelsNotLockedWarningLight.arg_number = 3030
WheelsNotLockedWarningLight.input = {-1.0, 1.0}
WheelsNotLockedWarningLight.output = {-1.0, 1.0}

FireWarningLight = CreateGauge("parameter")
FireWarningLight.parameter_name = "INST_FireWarningLight"
FireWarningLight.arg_number = 3010
FireWarningLight.input = {-1.0, 1.0}
FireWarningLight.output = {-1.0, 1.0}

GearRedLight1 = CreateGauge("parameter")
GearRedLight1.parameter_name = "INST_GearRedLight1"
GearRedLight1.arg_number = 3130
GearRedLight1.input = {-1.0, 1.0}
GearRedLight1.output = {-1.0, 1.0}

GearRedLight2 = CreateGauge("parameter")
GearRedLight2.parameter_name = "INST_GearRedLight2"
GearRedLight2.arg_number = 3140
GearRedLight2.input = {-1.0, 1.0}
GearRedLight2.output = {-1.0, 1.0}

GearRedLight3 = CreateGauge("parameter")
GearRedLight3.parameter_name = "INST_GearRedLight3"
GearRedLight3.arg_number = 3150
GearRedLight3.input = {-1.0, 1.0}
GearRedLight3.output = {-1.0, 1.0}

GearGreenLight1 = CreateGauge("parameter")
GearGreenLight1.parameter_name = "INST_GearGreenLight1"
GearGreenLight1.arg_number = 3100
GearGreenLight1.input = {-1.0, 1.0}
GearGreenLight1.output = {-1.0, 1.0}

GearGreenLight2 = CreateGauge("parameter")
GearGreenLight2.parameter_name = "INST_GearGreenLight2"
GearGreenLight2.arg_number = 3110
GearGreenLight2.input = {-1.0, 1.0}
GearGreenLight2.output = {-1.0, 1.0}

GearGreenLight3 = CreateGauge("parameter")
GearGreenLight3.parameter_name = "INST_GearGreenLight3"
GearGreenLight3.arg_number = 3120
GearGreenLight3.input = {-1.0, 1.0}
GearGreenLight3.output = {-1.0, 1.0}

-- ****************************************************
-- Gun sight

GunSightSizeSelKnob = CreateGauge("parameter")
GunSightSizeSelKnob.parameter_name = "INST_GunSightSizeSelKnob"
GunSightSizeSelKnob.arg_number = 1970
GunSightSizeSelKnob.input = {-1.0, 1.0}
GunSightSizeSelKnob.output = {-1.0, 1.0}

TurnAndBankRate = CreateGauge("parameter")
TurnAndBankRate.parameter_name = "INST_TurnAndBankRate"
TurnAndBankRate.arg_number = 1040
TurnAndBankRate.input = {-1.0, 1.0}
TurnAndBankRate.output = {-1.0, 1.0}

TurnAndBankSlip = CreateGauge("parameter")
TurnAndBankSlip.parameter_name = "INST_TurnAndBankSlip"
TurnAndBankSlip.arg_number = 1045
TurnAndBankSlip.input = {-1.0, 1.0}
TurnAndBankSlip.output = {-1.0, 1.0}

CockpitLight = CreateGauge("parameter")
CockpitLight.parameter_name = "INST_CockpitLight"
CockpitLight.arg_number = 3210
CockpitLight.input = {-1.0, 1.0}
CockpitLight.output = {-1.0, 1.0}

Canopy = CreateGauge("parameter")
Canopy.parameter_name = "INST_Canopy"
Canopy.arg_number = 3190
Canopy.input = {-1.0, 1.0}
Canopy.output = {-1.0, 1.0}

CanopyLever = CreateGauge("parameter")
CanopyLever.parameter_name = "INST_CanopyLever"
CanopyLever.arg_number = 3195
CanopyLever.input = {-1.0, 1.0}
CanopyLever.output = {-1.0, 1.0}



need_to_be_closed = false -- close lua state after initialization

livery = "default"

