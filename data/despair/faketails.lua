-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'0', '0'}
downoffsets = {'-6', '0'}
upoffsets = {'0', '0'}
rightoffsets = {'0', '0'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'fakerzalgotails-alpha'
doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/fakerzalgotails', 360, 371);

	addAnimationByPrefix(name_of_character, 'idle', 'fakerzalgotails idle', 12, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', 'fakerzalgotails left', 12, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', 'fakerzalgotails down', 12, false);
	addAnimationByPrefix(name_of_character, 'singUP', 'fakerzalgotails up', 12, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', 'fakerzalgotails right', 12, false);

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1, 1);
	
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 720 and curStep <= 816 then
		doIdle = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], true);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		end
	end

end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
	doIdle = true
end

function onUpdate()
	if curStep == 720 then
		addLuaSprite(name_of_character,false)
		setProperty(name_of_character..'.alpha',0.6)
		doTweenX('moveXZalgoTails',name_of_character,getProperty(name_of_character..'.x')-12,1,'cubeout')
	end

	if curStep == 816 then
		doTweenX('backXZalgoTails',name_of_character,getProperty(name_of_character..'.x')+12,1,'cubeout')
	end
end

function onTweenCompleted(tag)

	if tag == 'backXZalgoTails' then
		removeLuaSprite(name_of_character)
	end
end