-- **************************************************** 
-- Sound System
-- ****************************************************

cpt_sh = nil

-- Sounds 
plane_sounds ={	
	ExplosiveCharge2 = {},
	RocketBooster = {},
	sound_GyroStart = {},		
	sound_GyroStop = {},		
	sound_Switch = {},	 
	sound_SwitchPush = {},	
	sound_LeveMove1 = {},	 
	sound_LeveMove2 = {},	 
	sound_LeveMove3 = {},	 
	sound_LeveMove4 = {},	 
	engine_start = {},   
	engine_cabin_loop_start = {},	
	engine_cabin_loop_stop = {},	
	engine_cabin_loop = {},	
	suspension_1 = {},	
	suspension_2 = {},	
	buzzer1short = {},	
	buzzer2inter = {},
	AirflowStart = {},
	AirflowLoop = {},
	AirflowStop = {},
	RocketEngine1Stop = {},
	RocketEngine1Start = {},
	RocketEngine1Loop = {},
	LandImpact = {},
	RollingLoop = {},
	RollingStop = {},
	ExplosiveCharge = {},
	WindBlowing = {},
}


function createInternal(sound_host, sdef_name)
	return sound_host:create_sound("Aircrafts/Vampire-FB5/" .. sdef_name)
end

function createExternal(sound_host, sdef_name)
	return sound_host:create_sound("Aircrafts/Vampire-FB5/" .. sdef_name)
end

function createInternalLoop(sound_host, start_sound_length, sdef_name_start, sdef_name_loop, sdef_name_end)
    
    start_length_ = start_sound_length or 0
	
	if sdef_name_start then
		sound_start_ = createInternal(sound_host, sdef_name_start)
	else
		sound_start_ = nil
	end
	sound_loop_ = createInternal(sound_host, sdef_name_loop)
	
	if sdef_name_end then
    sound_end_ = createInternal(sound_host, sdef_name_end)
	else
		sound_end_ = nil
	end	
    
	return {
		startLength = start_length_,
		timePlaying = 0,
		isPlaying = false,
		sound_start = sound_start_,
		sound_loop = sound_loop_,
		sound_end = sound_end_,
	}
end

function createExternalLoop(sound_host, start_sound_length, sdef_name_start, sdef_name_loop, sdef_name_end)
	start_length_ = start_sound_length or 0
	
	if sdef_name_start then
		sound_start_ = createExternal(sound_host, sdef_name_start)
	else
		sound_start_ = nil
	end
	
	sound_loop_ = createExternal(sound_host, sdef_name_loop)
	
	if sdef_name_end then
		sound_end_ = createExternal(sound_host, sdef_name_end)
	else
		sound_end_ = nil
	end	
	
	return {
		startLength = start_length_,
		timePlaying = 0,
		isPlaying = false,
		sound_start = sound_start_,
		sound_loop = sound_loop_,
		sound_end = sound_end_,
	}
end

function updateSoundParameters(sound, pitch, gain, lowpass)
	if sound then
		sound:update(pitch, gain, lowpass)
	end
end

function stopSound(sound)	
	if sound and sound:is_playing() then
		sound:stop()		
	end	
end

function playSoundOnce(sound)	

	if sound~=nil then
		if sound:is_playing() then 
			sound:stop() 
		end		
		sound:play_once()
	end	

end

function stopLoopSound(loopSound, playEndSound)
	stopSound(loopSound.sound_start)
	stopSound(loopSound.sound_loop)
	loopSound.isPlaying = false
	loopSound.timePlaying = 0
	if playEndSound then
		playSoundOnce(loopSound.sound_end)
	end
end

function updateLoopSoundParameters(loopSound, pitch, gain, lowpass)
	updateSoundParameters(loopSound.sound_start, pitch, gain, lowpass)
	updateSoundParameters(loopSound.sound_loop, pitch, gain, lowpass)
	updateSoundParameters(loopSound.sound_end, pitch, gain, lowpass)
end

function playSoundOnceFromParam(param, sound)
	if param:get() > -999 then
		if sound then
			if sound:is_playing() then 
				sound:stop() 
			end
			if param:get() ~= 0 then
				sound:play_once()				
			end
		end
		param:set(-999)
	end
end

function playLoopingSound(loopSound)
	loopSound.sound_loop:play_continue()
end

function playLoopingSound2(sound_loop)	
	
	if sound_loop then
		sound_loop:play_continue()	
	end	

end

function stopLoopingSound2(sound_loop)	
	
	if sound_loop:is_playing() then 		
		sound_loop:stop() 
	end	

end



function playLoopingSoundFromParam(param, loopSound)
	if param == nil then
		loopSound.sound_loop:play_continue()
		return
	end

	if param:get() > -999 then
		if loopSound then
			if param:get() == 0 and loopSound.isPlaying then
				--Stop command given
				stopLoopSound(loopSound, true)
			elseif param:get() ~= 0 then
				--Play command given
				if loopSound.isPlaying then
					-- first stop if playing
					stopLoopSound(loopSound)
				end
				
				if loopSound.sound_start then
					loopSound.sound_start:play_once()
				else
					loopSound.sound_loop:play_continue()
				end
				loopSound.isPlaying = true

			end
		end
		param:set(-999)
	else
        --no sound command given, manage start/looping sound
		if loopSound.isPlaying then
			loopSound.timePlaying = loopSound.timePlaying + dt
			
			if loopSound.sound_start and loopSound.sound_start:is_playing() then
				if loopSound.timePlaying > (loopSound.startLength - dt) then					
					loopSound.sound_loop:play_continue()
				end
				if loopSound.timePlaying > loopSound.startLength then
					loopSound.sound_start:stop()
					loopSound.sound_loop:play_continue()
				end
			else
				loopSound.sound_loop:play_continue()
			end
		end
	end
end

function InitializeSoundSystem(module)

	if create_sound_host ~= nil then 
			
		-- print_messa_to_user("Creating sound_host for "..module)
			
		cpt_sh 							= create_sound_host("COCKPIT","HEADPHONES",0,0,0)

		plane_sounds.GoblinLoop1 				= createInternal(cpt_sh, "Goblin-Loop-1")

		plane_sounds.ExplosiveCharge2 				= createInternal(cpt_sh, "ExplosiveCharge")
		plane_sounds.RocketBooster 				= createInternal(cpt_sh, "RocketBooster")

		plane_sounds.ExplosiveCharge 				= createInternal(cpt_sh, "ExplosiveCharge")

		plane_sounds.WindBlowing 					= createInternal(cpt_sh, "WindBlowing")
		
		plane_sounds.sound_GyroStart 				= createInternal(cpt_sh, "Gyrostart")
		plane_sounds.sound_GyroLoop 				= createInternal(cpt_sh, "GyroLoop")
		plane_sounds.sound_GyroStop 					= createInternal(cpt_sh, "Gyrostop")
		
		plane_sounds.sound_Switch    				= createInternal(cpt_sh, "Switch")
		plane_sounds.sound_SwitchPush				= createInternal(cpt_sh, "SwitchPush")
        
		plane_sounds.sound_LeveMove1 				= createInternal(cpt_sh, "LeveMove1")
		plane_sounds.sound_LeveMove2     			= createInternal(cpt_sh, "LeveMove2")        
 
		plane_sounds.sound_LeveMove3 				= createInternal(cpt_sh, "ClickThumb")
		plane_sounds.sound_LeveMove4     			= createInternal(cpt_sh, "ClickThumb2")        

		plane_sounds.engine_start     				= createInternal(cpt_sh, "EngineStart")      
		
		plane_sounds.engine_cabin_loop_start     	= createInternal(cpt_sh, "EngineCabinLoopStart") 

		plane_sounds.engine_cabin_loop_stop     		= createInternal(cpt_sh, "EngineCabinLoopStop") 

		plane_sounds.engine_cabin_loop     			= createInternal(cpt_sh, "EngineCabinLoop")   
		
		plane_sounds.suspension_1     			= createInternal(cpt_sh, "SuspensionImpact1")   

		plane_sounds.suspension_2     			= createInternal(cpt_sh, "SuspensionImpact2")   

		plane_sounds.buzzer1short     			= createInternal(cpt_sh, "Buzzer1short")   

		plane_sounds.buzzer2inter     			= createInternal(cpt_sh, "buzzer2inter")   	
		
		plane_sounds.RocketEngine1Start     	= createInternal(cpt_sh, "RocketEngine1Start")   	

		plane_sounds.RocketEngine1Stop     	= createInternal(cpt_sh, "RocketEngine1Stop")   	

		plane_sounds.RocketEngine1Loop     	= createInternal(cpt_sh, "RocketEngine1Loop")
				
		plane_sounds.AirflowLoop     	= createInternal(cpt_sh, "AirflowLoop")

		plane_sounds.AirflowStart     	= createInternal(cpt_sh, "AirflowStart")

		plane_sounds.AirflowStop    	= createInternal(cpt_sh, "AirflowStop")

		plane_sounds.LandImpact    	= createInternal(cpt_sh, "LandImpact")		

		plane_sounds.RollingLoop = createInternal(cpt_sh, "RollingLoop")

		plane_sounds.RollingStop = createInternal(cpt_sh, "RollingStop")
			
	end


end    