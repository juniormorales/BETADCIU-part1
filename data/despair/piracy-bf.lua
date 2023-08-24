-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'-13', '-1'}
downoffsets = {'-8', '-4'}
upoffsets = {'0', '3'}
rightoffsets = {'9', '-4'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'piracybf'
doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/piracybf', 220, 300);

	addAnimationByPrefix(name_of_character, 'idle', 'idle', 24, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', 'left', 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', 'down', 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', 'up', 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', 'right', 24, false);

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', true);
	scaleObject(name_of_character, 0.3, 0.3);
	setProperty(name_of_character.. '.angle',20)
	
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 2496 and curStep <= 2543 then
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