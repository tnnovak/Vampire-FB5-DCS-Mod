local count = 0
local function counter()
	count = count + 1
	return count
end
-------DEVICE ID-------
devices                     = {}

devices["ENGINE"]           = counter()		
devices["AVIONICS"]         = counter()		
devices["GEAR"]				= counter()
devices["WEAPON_SYSTEM"]    = counter()		
devices["CONTROL_INTERFACE"]		= counter()


