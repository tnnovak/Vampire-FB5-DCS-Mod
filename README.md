# Vampire-FB5-DCS-Mod
Vampire FB5 DCS World MOD
Vampire-FB5 Mod

<img src="https://github.com/tnnovak/Vampire-FB5-DCS-Mod/blob/main/images/montagem.png">

This is a rather still experimental version. Error reporting, feedbacks and improvement sugestions are wellcome.

MOD zip file:
<a href="https://github.com/tnnovak/Vampire-FB5-DCS-Mod/releases/tag/v1.0.0.-alpha">here</a>

(should go to "[user]\Saved Games\DCS\Mods\Aircraft\Vampire-FB5\" with all subfolders inside, as usual)

Part of the logic inside the EFM on this MOD made use of my custom Graph to C logic generator, you can check here:

<a href="https://github.com/tnnovak/Flow-System">Flow System on Github</a>

## Features NOT avaiable, WIP:

* External fuel tanks
* Complete damage model
* EFM: Non-linear and better spin behaviour, better compressibility effects
* Gunsight algorithm
* Some instruments
* Oxygen system
* Many other small bugs
* 3d model needs much attention (better liveries, fix normals and others)

## Works:

* Basic EFM with flight envelope more or less close to Vampire curves
* Weapons: bombs and rockets
* Basic aircraft systems: pneumatic, hydraulic, electric and engine, gears
* Basic cockpit instruments
* Airbrakes (lacks external animation)

## Cold startup Sequence

Check right panel switches below:

<img src="https://github.com/tnnovak/Vampire-FB5-DCS-Mod/blob/main/images/cockpit.png"></img>

1. Click Battery ON switch
2. High pressure fuel valve ON
3. Low Pressure fuel valve ON
4. Throttle full back
5. Click gyro switch ON
6. Click booster pump ON
7. Click Ground power selector ON
8. Click engine start switch
9. Wait EGT and RPM to stablize at 3000 rpm (idle)

Dont move throttle too fast or engine will stall /  surge

If necessary: <br>
* external lights ON
* cockpit lights ON

On taxi: <br>
* <b>LCtrl + S</b> --> brakes left
* <b>LCtrl + D</b> --> brakes right
* <b>LAlt +  S</b> --> apply both brakes

Press F to deploy full flaps

Rotate about 100 mph

Press F to retract flaps, press G to retract gears (3 greens lights, gears down, 3 red lights gears retracting / extending, no lights gears retracted)

## Weapons controls

* Switch Master weapons ON
* Select Bombs or Rockets on B/R switch
* Select mode on Salvo mode switch (for rockets only): single or all

  <b>LAlt + SPACE</b> to fire

Turn gunsight ON on the gunsight ON/OFF switch<br>
Move sight:<br> 
* up/down --> LCtrl + I, LCtrl + M
* left / right --> LCtrl + I, LCtrl + M

Adjust gunsight size in the gunsight dial on the device front

## Flight controls

Pitch TRIM (check trim indicator, left side of the Gunsight):  
* , Trim UP
* . Trim Down

Airbrakes: LAlt + A (external animation not working yet)

## Fuel System

Comsumption: Tip tanks first, wing tanks second, fuselage tank last

Full internal tanks, sea level, full throttle endurance: around 60 minutes

Indicators: 

<img src="https://github.com/tnnovak/Vampire-FB5-DCS-Mod/blob/main/images/fuel-indicators.png">

## Other controls

<b>LShift + S</b>: Hide stick (usefull to check center fuel tank indicator behind the stick)




