-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'220', '-60'}
downoffsets = {'10', '-315'}
upoffsets = {'20', '140'}
rightoffsets = {'40', '0'}
defaultOpponentX = -500;
defaultOpponentY = 200;
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'majin'
doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/MajinEnterprise', defaultOpponentX, defaultOpponentY);

	addAnimationByPrefix(name_of_character, 'idle', 'idle', 24, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', 'left', 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', 'down', 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', 'up', 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', 'right', 24, false);

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1, 1);

	makeAnimatedLuaSprite('downHead','characters/majinDown',defaultOpponentX + 100,defaultOpponentY + 145)
	addAnimationByPrefix('downHead','down','downhead',24,false)

	makeLuaSprite('rocksMajin', 'Mainrocks', -2100, -650);
	
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 3503 and curStep <= 3695 then
		doIdle = false

		if noteData ~= 1 and noteType ~= nil or noteType == 'GF Sing' then
               setProperty('downHead.visible', false)
         else
			setProperty('downHead.visible', true)
			setObjectOrder('downHead',getObjectOrder('majin') + 2)
			playAnim('downHead','down',true)
		end
		setObjectOrder('downHead',getObjectOrder('majin') + 2)

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

	if curStep == 3488 then

		addLuaSprite('majin',false)
		setObjectOrder('majin',getObjectOrder('tormentBG') + 1)
		addLuaSprite('rocksMajin',false)
		setObjectOrder('rocksMajin',getObjectOrder('tormentBG') + 2)

		setObjectOrder('downHead',getObjectOrder('majin') + 2)
		setProperty('downHead.visible', false)

		doTweenY('tweenYMajin','majin',getProperty('majin.y')-300,0.7,'quadOut')
		doTweenY('tweenYRocksMajin','rocksMajin',getProperty('rocksMajin.y')-300,0.7,'quadOut')
	end
end

function onTweenCompleted(tag)
	 if tag == 'tweenYMajin' then
	 	setProperty('downHead.x',getProperty('majin') + 100);
	 	setProperty('downHead.y',getProperty('majin') + 145)
	 end
end