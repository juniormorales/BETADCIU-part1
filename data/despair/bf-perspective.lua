-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'-14', '0'}
downoffsets = {'21', '-34'}
upoffsets = {'-16', '42'}
rightoffsets = {'83', '-1'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'bf_perspective'
doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/bf_anti_pov', 2300, 1150);

	addAnimationByPrefix(name_of_character, 'idle', 'bf idle', 24, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', 'bf left0', 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', 'bf down0', 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', 'bf up0', 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', 'bf right0', 24, false);

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', true);
	scaleObject(name_of_character, 1.6, 1.6);

	makeLuaSprite('bfBG', 'dead_split_4', 550, 190);
	
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if (curStep >= 1008 and curStep <= 1103) or (curStep >= 1199 and curStep <= 1296) then
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
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end

	doIdle = true
end
	
function onUpdate()
	if curStep == 912 then
		addLuaSprite('bfBG',true)
		addLuaSprite('bf_perspective',true)
	end

	if curStep == 1000 then
		doTweenX('moveX1BfPerspective','bf_perspective', getProperty('bf_perspective.x') - 500, 1, 'cubeout');
		doTweenY('moveY1BfPerspective','bf_perspective', getProperty('bf_perspective.y') - 500, 1, 'cubeout');

		doTweenX('moveX1BfBG','bfBG', getProperty('bfBG.x') - 500, 1, 'cubeout');
		doTweenY('moveY1BfBG','bfBG', getProperty('bfBG.y') - 500, 1, 'cubeout');
	end

	if curStep == 1104 then
		doTweenX('leaveX1BfPerspective','bf_perspective', getProperty('bf_perspective.x') + 500, 1, 'cubeout');
		doTweenY('leaveY1BfPerspective','bf_perspective', getProperty('bf_perspective.y') + 500, 1, 'cubeout');

		doTweenX('leaveX1BfBG','bfBG', getProperty('bfBG.x') + 500, 1, 'cubeout');
		doTweenY('leaveY1BfBG','bfBG', getProperty('bfBG.y') + 500, 1, 'cubeout');
	end

	if curStep == 1197 then
		doTweenX('moveX2BfPerspective','bf_perspective', getProperty('bf_perspective.x') - 500, 1, 'cubeout');
		doTweenY('moveY2BfPerspective','bf_perspective', getProperty('bf_perspective.y') - 500, 1, 'cubeout');

		doTweenX('moveX2BfBG','bfBG', getProperty('bfBG.x') - 500, 1, 'cubeout');
		doTweenY('moveY2BfBG','bfBG', getProperty('bfBG.y') - 500, 1, 'cubeout');
	end

	if curStep == 1293 then
		doTweenX('leaveX2BfPerspective','bf_perspective', getProperty('bf_perspective.x') + 500, 1, 'cubeout');
		doTweenY('leaveY2BfPerspective','bf_perspective', getProperty('bf_perspective.y') + 500, 1, 'cubeout');

		doTweenX('leaveX2BfBG','bfBG', getProperty('bfBG.x') + 500, 1, 'cubeout');
		doTweenY('leaveY2BfBG','bfBG', getProperty('bfBG.y') + 500, 1, 'cubeout');
	end
end

function onTweenCompleted(tag)

	if tag == 'leaveX2BfPerspective' then

		removeLuaSprite('bf_perspective')
		removeLuaSprite('bfBG')
	end
end