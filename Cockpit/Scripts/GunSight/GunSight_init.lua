dofile(LockOn_Options.common_script_path.."devices_defs.lua")
dofile(LockOn_Options.common_script_path.."ViewportHandling.lua") 

indicator_type       = indicator_types.COLLIMATOR
purposes 	   		 = {render_purpose.GENERAL,render_purpose.HUD_ONLY_VIEW}

-- if LockOn_Options.screen.oculus_rift == true then
	-- indicator_type = indicator_types.HELMET
-- end

-- BASE    = 1 
-- PAGE    = 2 

-- page_subsets  = {
-- 	[BASE]    		= LockOn_Options.script_path.."GunSight/GunSight_base_page.lua",   
-- 	[PAGE]    		= LockOn_Options.script_path.."GunSight/GunSight_page.lua",   
-- }
-- pages = {
-- 	{ BASE, PAGE}, 
-- }

-- init_pageID = 1 
-- -- collimator_default_distance_factor = {0.6,0,0}  -- angular size operations will use this as reference to calculate coverage and collimation

-- Set display size (adjust as needed)
page_subsets = {
    [1] = LockOn_Options.script_path.."GunSight/page.lua"
}

-- Select subset
pages = {
    [1] = {1}
}

init_pageID = 1
used_render_mask = nil
indicator_type = indicator_types.COMMON
purposes = {render_purpose.GENERAL}

update_screenspace_diplacement(SelfWidth/SelfHeight,false)
dedicated_viewport_arcade = dedicated_viewport