-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'-225', '-23'}
downoffsets = {'-94', '-19'}
upoffsets = {'-112', '83'}
rightoffsets = {'16', '-14'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'sunky'
doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/sunky2', 1500, 1200);

	addAnimationByIndices(name_of_character,'danceLeft','idle','0,1,2,3,4,5')
	addAnimationByIndices(name_of_character,'danceRight','idle','7,8,9,10,11,12,13,14')
	addAnimationByPrefix(name_of_character, 'singLEFT', 'left', 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', 'down', 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', 'up', 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', 'right', 24, false);

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', true);
	scaleObject(name_of_character, 1.3, 1.3);

	makeLuaSprite('sunkyBG', 'dead_split_3', 50, 150);
	
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 3600 and curStep <= 3695 then
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
		elseif direction == 4 then
			setProperty(name_of_character .. '.offset.x', animaciooffsets[1]);
			setProperty(name_of_character .. '.offset.y', animacionoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
		end
	end

end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and doIdle then
		objectPlayAnimation(name_of_character, 'danceRight');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end

	if curBeat % 2 ~= 0  and doIdle then
		objectPlayAnimation(name_of_character, 'danceLeft');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
	doIdle = true
end
	
function onUpdate()
	if curStep == 3595 then
		addLuaSprite('sunkyBG',true)
		addLuaSprite('sunky',true)

		setObjectOrder('sunkyBG',getObjectOrder('tailsdoll1') - 1)

		doTweenX('moveXSunky','sunky', getProperty('sunky.x') - 500, 1, 'cubeout');
		doTweenY('moveYSunky','sunky', getProperty('sunky.y') - 500, 1, 'cubeout');

		doTweenX('moveXBG','sunkyBG', getProperty('sunkyBG.x') - 500, 1, 'cubeout');
		doTweenY('moveYBG','sunkyBG', getProperty('sunkyBG.y') - 500, 1, 'cubeout');
	end
end