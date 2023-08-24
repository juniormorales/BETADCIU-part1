local allowCountdown = false

function onStartCountdown()
	if not allowCountdown then
		runTimer('start', 0);
		allowCountdown = true;
		startCountdown();
		return Function_Stop;
	end
	return Function_Continue;
end

function onUpdate()
	setTextString('botplayTxt','')

	if curStep == 1584 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
		setProperty('streetBackError.alpha',1)
		setProperty('streetFrontError.alpha',1)
	end

	if curStep == 2096 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
		setProperty('streetBackError.alpha',0)
		setProperty('streetFrontError.alpha',0)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'start' then

		setProperty('healthBar.alpha', tonumber(0))
    	setProperty('iconP1.alpha', tonumber(0))
    	setProperty('iconP2.alpha', tonumber(0))
    	setProperty('score.alpha', tonumber(0))

		makeLuaSprite('black', 'black', -700, 0);
		scaleObject('black',5,5)
		addLuaSprite('black', true);
		runTimer('fadein', 1, 1);
		runTimer('fadeout', 17, 1);

	elseif tag == 'fadeout' then
		doTweenAlpha('blackfade', 'black', 0, 0.8, 'linear');
		doTweenAlpha('iconP1fade', 'iconP1', 1, 0.8, 'linear');
		doTweenAlpha('iconP2fade', 'iconP2', 1, 0.8, 'linear');
		doTweenAlpha('healthBarfade', 'healthBar', 1, 0.8, 'linear');
	end
end

function onTweenCompleted(tag)

	if tag == 'blackfade' then
		removeLuaSprite('black')
	end
end

function createQTStage()
	makeLuaSprite('streetBackCute', 'background/qt/streetBack', -700, -300);

	makeLuaSprite('streetBackError', 'background/qt/streetError', -700, -300);
	
	makeLuaSprite('streetFrontCute', 'background/qt/streetFront', -650, 600);

	makeLuaSprite('streetFrontError', 'background/qt/streetFrontError', -650, 600);

	makeAnimatedLuaSprite('tv', 'background/qt/TV_V4', -50, 450)
	setProperty('tv.antialiasing', true)
	scaleObject('tv',1.1,1.1)
	addAnimationByPrefix('tv', 'warning', 'TV_Attention', 24, false)
	addAnimationByPrefix('tv', 'iddle', 'TV_Idle', 24, false)
	addAnimationByPrefix('tv', 'eyes', 'TV_eyes', 24, false)
	addAnimationByPrefix('tv','blue','TV_Bluescreen',24,false)
	addAnimationByPrefix('tv','error','TV_Error',24,false)

	makeAnimatedLuaSprite('gas1', 'background/qt/Gas_Release', -700, 40)
	setProperty('gas1.antialiasing', true)
	scaleObject('gas1',1.1,1.1)
	addAnimationByPrefix('gas1', 'iddle', 'Gas_Release', 24, true)

	makeAnimatedLuaSprite('gas2', 'background/qt/Gas_Release', 500, 40)
	setProperty('gas2.antialiasing', true)
	scaleObject('gas2',1.1,1.1)
	addAnimationByPrefix('gas2', 'iddle', 'Gas_Release', 24, true)

	makeAnimatedLuaSprite('gas3', 'background/qt/Gas_Release', 850, 50)
	setProperty('gas3.antialiasing', true)
	scaleObject('gas3',1.1,1.1)
	addAnimationByPrefix('gas3', 'iddle', 'Gas_Release', 24, true)

	addLuaSprite('streetBackCute',false)
	addLuaSprite('streetBackError',false)
	setProperty('streetBackError.alpha',0)
	addLuaSprite('streetFrontCute',false)
	addLuaSprite('streetFrontError',false)
	setProperty('streetFrontError.alpha',0)
	addLuaSprite('tv',false)
	addLuaSprite('gas1',false)
	addLuaSprite('gas2',false)
	addLuaSprite('gas3',false)
	playAnim('tv','iddle',true)
	playAnim('gas1','iddle',true)
	playAnim('gas2','iddle',true)
	playAnim('gas3','iddle',true)
end

function onBeatHit()
	if curStep <= 1584 or curStep >= 2096 then
		if curBeat % 2 == 0 then
			playAnim('tv','iddle',true)
		else
			playAnim('tv','eyes',true)
		end
	else
		if curBeat % 4 == 0 then
			playAnim('tv','blue',true)
		else
			playAnim('tv','error',true)
		end		
	end
end

function onCreate()

	setObjectOrder('gfGroup', getObjectOrder('dadGroup'));
	-- QT STAGE
	createQTStage();

end

function onStepHit()
	if curStep == 1 then
		playSound("alert",0.3)
	end

	if curStep == 16 then
		playSound("alert",0.3)
	end

	if curStep == 32 then
		playSound("alert",0.3)
	end

	if curStep == 48 then
		playSound("alert",0.3)
	end

	if curStep == 56 then
		playSound("alert",0.3)
	end

	if curStep == 64 then
		playSound("alert",0.3)
	end

	if curStep == 80 then
		playSound("alert",0.3)
	end

	if curStep == 96 then
		playSound("alert",0.3)
	end

	if curStep == 112 then
		playSound("alert",0.3)
	end

	if curStep == 120 then
		playSound("alertALT",0.3)
	end	

	if curStep == 128 then
		playSound("alert",0.3)
	end

	if curStep == 144 then
		playSound("alert",0.3)
	end

	if curStep == 160 then
		playSound("alert",0.3)
	end

	if curStep == 176 then
		playSound("alert",0.3)
	end

	if curStep == 184 then
		playSound("alertALT2",0.3)
	end

	if curStep == 192 then
		playSound("alert",0.3)
	end

	if curStep == 208 then
		playSound("alert",0.3)
	end

	if curStep == 224 then
		playSound("alert",0.3)
	end

	if curStep == 240 then
		playSound("alert",0.3)
	end

	if curStep == 248 then
		playSound("alertALT3",0.3)
	end
end

    local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if (curStep >= 831 and curStep <= 1023) or (curStep >= 1903 and curStep <= 2095) then
		doIdle = false
		characterPlayAnim('gf', singAnims[direction + 1], true);

		if direction == 0 then
			setProperty('gf.offset.x', leftoffsets[1]);
			setProperty('gf.offset.y', leftoffsets[2]);

			if isSustainNote then
				characterPlayAnim('gf', singAnims[direction + 1], true);
			end
		elseif direction == 1 then
			setProperty('gf.offset.x', downoffsets[1]);
			setProperty('gf.offset.y', downoffsets[2]);

			if isSustainNote then
				characterPlayAnim('gf', singAnims[direction + 1], true);
			end
		elseif direction == 2 then
			setProperty('gf.offset.x', upoffsets[1]);
			setProperty('gf.offset.y', upoffsets[2]);

			if isSustainNote then
				characterPlayAnim('gf', singAnims[direction + 1], true);
			end
		elseif direction == 3 then
			setProperty('gf.offset.x', rightoffsets[1]);
			setProperty('gf.offset.y', rightoffsets[2]);

			if isSustainNote then
				characterPlayAnim('gf', singAnims[direction + 1], true);
			end
		elseif direction == 4 then
			setProperty('gf.offset.x', animaciooffsets[1]);
			setProperty('gf.offset.y', animacionoffsets[2]);

			if isSustainNote then
				characterPlayAnim('gf', singAnims[direction + 1], true);
			end
		end
	end
end