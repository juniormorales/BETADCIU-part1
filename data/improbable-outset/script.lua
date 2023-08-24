function onUpdate()
	setTextString('botplayTxt','')

	if curStep == 304 then
		doTweenAlpha('healthBarfade', 'healthBar', 0, 0.6, 'linear');
		doTweenAlpha('iconP1Barfade', 'iconP1', 0, 0.6, 'linear');
		doTweenAlpha('iconP2Barfade', 'iconP2', 0, 0.6, 'linear');

		doTweenAlpha('bffade', 'boyfriend', 0, 0.6, 'linear');
		doTweenAlpha('dadfade', 'dad', 0, 0.6, 'linear');
		doTweenAlpha('gffade', 'gf', 0, 0.6, 'linear');

		doTweenAlpha('floorFade', 'floor', 0, 0.6, 'linear');
		doTweenAlpha('skyFade', 'sky', 0, 0.6, 'linear');
		doTweenAlpha('hotdogFade', 'hotdog', 0, 0.6, 'linear');

	end

	if curStep == 447 then
		playSound('vine',0.5)
	end

	if curStep == 448 then
		setProperty('boyfriend.alpha',1)
		addRonStage()
	end

	if curStep == 575 then
		removeRonStage()
		cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
		addTordStage()
		addLuaSprite('blackBG',true)
		addLuaSprite('pixel1',true)
		playAnim('pixel1', 'idle', false)
		addLuaSprite('maelstrom',true)
		addLuaSprite('aiBG',true)
		addLuaSprite('pixel2',true)
		playAnim('pixel2', 'idle', false)
		addLuaSprite('ai',true)

		addLuaSprite('mario',true)
		addLuaSprite('xeno',true)
	end

	if curStep == 696 then
		doTweenX('slideLeftMaelstrom','maelstrom',getProperty('maelstrom.x') - 1000, 0.8, 'quadOut')
		doTweenX('slideLeftPixel','pixel1',getProperty('pixel1.x') - 1000, 0.8, 'quadOut')
		doTweenX('slideLeftMaelstromBG','blackBG',getProperty('blackBG.x') - 1000, 0.8, 'quadOut')
		doTweenX('slideLeftTord','boyfriend',getProperty('boyfriend.x') - 400, 0.8, 'quadOut')
		doTweenX('slideLeftTordBG','tordbg',getProperty('tordbg.x') - 400, 0.8, 'quadOut')
	end

	if curStep == 820 then
		doTweenX('slideRightMaelstrom','maelstrom',getProperty('maelstrom.x') +200 , 0.6, 'quadOut')
		doTweenX('slideRightPixel','pixel1',getProperty('pixel1.x') +400, 0.6, 'quadOut')
		doTweenX('slideRightMaelstromBG','blackBG',getProperty('blackBG.x') + 400, 0.6, 'quadOut')

		doTweenX('slideRightTord','boyfriend',getProperty('boyfriend.x') +  400, 0.6, 'quadOut')
		doTweenX('slideRightTordBG','tordbg',getProperty('tordbg.x') + 400, 0.6, 'quadOut')

		doTweenX('slideRightAi','ai',getProperty('ai.x') +800 , 0.6, 'quadOut')
		doTweenX('slideRightPixel2','pixel2',getProperty('pixel2.x') +800, 0.6, 'quadOut')
		doTweenX('slideRightAiBG','aiBG',getProperty('aiBG.x') + 800, 0.6, 'quadOut')
	end

	if curStep == 950 then
		doTweenX('tweenXEnterMario','mario', getProperty('mario.x') - 500 , 0.5, 'cubeout');
		doTweenY('tweenYEnterMario', 'mario', getProperty('mario.y') - 450, 0.5, 'cubeout');

		doTweenX('tweenXEnterXeno','xeno', getProperty('xeno.x') + 500 , 0.5, 'cubeout');
		doTweenY('tweenYEnterXeno', 'xeno', getProperty('xeno.y') - 500, 0.5, 'cubeout');
	end

	if curStep == 1087 then
		doTweenX('leaveAi','ai',getProperty('ai.x') -800 , 0.6, 'quadOut')
		doTweenX('leavePixel2','pixel2',getProperty('pixel2.x') -800, 0.6, 'quadOut')
		doTweenX('leaveBG','aiBG',getProperty('aiBG.x') - 800, 0.6, 'quadOut')

		doTweenX('leaveMaelstrom','maelstrom',getProperty('maelstrom.x') +800 , 0.6, 'quadOut')
		doTweenX('leavePixel','pixel1',getProperty('pixel1.x') +800, 0.6, 'quadOut')
		doTweenX('leaveMaelstromBG','blackBG',getProperty('blackBG.x') + 800, 0.6, 'quadOut')

		doTweenX('tweenXLeaveMario','mario', getProperty('mario.x') + 500 , 0.6, 'cubeout');
		doTweenY('tweenYLeaveMario', 'mario', getProperty('mario.y') + 500, 0.6, 'cubeout');

		doTweenX('tweenXLeaveXeno','xeno', getProperty('xeno.x') - 500 , 0.6, 'cubeout');
		doTweenY('tweenYLeaveXeno', 'xeno', getProperty('xeno.y') + 500, 0.6, 'cubeout');

		cameraFlash('camHUD', '0xFFFFFFFF', 0.3)
		removeLuaSprite('tordbg')

		addNatsukiStage();
	end

	if curStep == 1330 then
		addLuaSprite('NMSansJump',true)
		playSound('NMSansJumpscare',0.4)
	end

	if curStep == 1343 then
		removeNatsukiStage();
		addNMSansStage();
		setProperty('gf.alpha',1)
	end
	if curStep == 1444 then
		playSound('nmbendy_land',0.45)
	end
	if curStep == 1590 then
		addLuaSprite('NMBendyJump',true)
		playSound('NMBendyJumpscare',0.4)
	end

	if curStep == 1600 then
		removeNMSansStage();
		addIratusStage();
	end
end

function createIratusStage()

	makeLuaSprite('iratusFloor', 'background/mouse/ROCK_BG', 0, 850);
	makeLuaSprite('iratusSky', 'background/mouse/INFERNO_SKY', 0, 0);

	makeAnimatedLuaSprite('iratusSkulls', 'background/mouse/SKULLS', 100, 650)
	setProperty('iratusSkulls.antialiasing', true)
	addAnimationByPrefix('iratusSkulls', 'anim', 'SKULLS', 24, true)
end

function addIratusStage()
	addLuaSprite('iratusSky',false)
	addLuaSprite('iratusSkulls',false)
	playAnim('iratusSkulls','anim',true)
	addLuaSprite('iratusFloor',false)
end

function createNMSansStage()
	makeAnimatedLuaSprite('NMSansBG', 'background/NMSans/Nightmare Sans Stage', 0, 0)
	scaleObject('NMSansBG',1.3,1.3)
	setProperty('NMSansBG.antialiasing', true)
	addAnimationByPrefix('NMSansBG', 'anim1', 'Normal instance', 24, false)
end

function addNMSansStage()
	addLuaSprite('NMSansBG',false)
	playAnim('NMSansBG','anim1',true)
end

function removeNMSansStage()
	removeLuaSprite('NMSansBG')
end

function createNMSansJumpscare()
	makeAnimatedLuaSprite('NMSansJump', 'jumpscare/NightmareJumpscares02', 0, 0)
	setProperty('NMSansJump.antialiasing', true)
	addAnimationByPrefix('NMSansJump', 'anim1', 'Wussup Bitch instance', 24, false)
	screenCenter('NMSansJump')
	setObjectCamera('NMSansJump',  'hud')
end

function createNMBendyJumpscare()
	makeAnimatedLuaSprite('NMBendyJump', 'jumpscare/NightmareJumpscares03', 0, 0)
	setProperty('NMBendyJump.antialiasing', true)
	addAnimationByPrefix('NMBendyJump', 'anim1', 'Emmi instance', 24, false)
	screenCenter('NMBendyJump')
	setObjectCamera('NMBendyJump',  'hud')
end

function createNatsukiStage()
	makeLuaSprite('natsky', 'background/natsuki/dnatbgsky', -200, -150);
	setScrollFactor('natsky', 0.1, 0.1);
	
	makeLuaSprite('natmountain', 'background/natsuki/dnatbgcliffs', 0, -150);
	setScrollFactor('natmountain', 0.2, 0.2);
	
	makeLuaSprite('natcity2', 'background/natsuki/dnatbgcity2', -50, -150);
	setScrollFactor('natcity2', 0.4, 0.4);
	
	makeLuaSprite('natcity1', 'background/natsuki/dnatbgcity1', -50, -150);
	setScrollFactor('natcity1', 0.5, 0.5);
	
	makeLuaSprite('nattrees', 'background/natsuki/dnatbgtrees', 200, -200);
	setScrollFactor('nattrees', 0.9, 0.9);
	
	makeLuaSprite('natfloor', 'background/natsuki/dnatbgfloor', 200, 150);
	setScrollFactor('natfloor', 1, 1);
	
	makeLuaSprite('natwall', 'background/natsuki/dnatbgwall', 200, 150);
	setScrollFactor('natwall', 1, 1);
end

function addNatsukiStage()
	addLuaSprite('natsky', false);
	addLuaSprite('natmountain', false);
	addLuaSprite('natcity2', false);
	addLuaSprite('natcity1', false);
	addLuaSprite('nattrees', false);
	addLuaSprite('natfloor', false);
	addLuaSprite('natwall', false);
end

function removeNatsukiStage()
	removeLuaSprite('natsky');
	removeLuaSprite('natmountain');
	removeLuaSprite('natcity2');
	removeLuaSprite('natcity1');
	removeLuaSprite('nattrees');
	removeLuaSprite('natfloor');
	removeLuaSprite('natwall');
end

function createRonStage()

	makeLuaSprite('ronbg2', 'background/ron/conall_bgBehind', 0, 0);
	makeLuaSprite('ronbg1', 'background/ron/conall_bg', 0, 0);
	makeLuaSprite('bucket', 'background/ron/conall_bucket', -250, -50);
	makeLuaSprite('ronSky', 'background/ron/conall_sky', 0, 0);
end

function addRonStage()
	addLuaSprite('ronSky',false)
	addLuaSprite('ronbg2',false)
	addLuaSprite('ronbg1',false)
	addLuaSprite('bucket',false)
end

function removeRonStage()
	removeLuaSprite('ronSky')
	removeLuaSprite('ronbg2')
	removeLuaSprite('ronbg1')
	removeLuaSprite('bucket')
end

function createTordStage()
	makeLuaSprite('tordbg','background/tord/TordBG',-100,-500)
end

function addTordStage()
	addLuaSprite('tordbg',false)
end

function removeTordStage()
	removeLuaSprite('tordbg')
end

function onTweenCompleted(tag)
	if tag == 'bffade' then
		doTweenAlpha('dadfadeIn', 'dad', 1, 0.6, 'linear');
	end

	if tag == 'slideLeftTord' then
		camNewPos = {getProperty('boyfriend.cameraPosition')[1] - 400 , getProperty('boyfriend.cameraPosition')[2]}
		setProperty('boyfriend.cameraPosition', camNewPos);
	end

	if tag == 'slideRightTord' then
		camNewPos = {getProperty('boyfriend.cameraPosition')[1] + 400 , getProperty('boyfriend.cameraPosition')[2]}
		setProperty('boyfriend.cameraPosition', camNewPos);
	end

	if tag == 'leaveAi' then
		removeLuaSprite('ai')
		removeLuaSprite('maelstrom')
		removeLuaSprite('pixel1')
		removeLuaSprite('pixel2')
		removeLuaSprite('aiBG')
		removeLuaSprite('blackBG')
		removeLuaSprite('xeno')
		removeLuaSprite('mario')
	end
end

function onCreate()
	createRonStage();
	createTordStage();

	createNatsukiStage();
	createNMSansJumpscare();

	createNMSansStage();
	createNMBendyJumpscare();

	createIratusStage();
end

function onBeatHit()
	if getProperty('NMBendyJump.animation.curAnim.name') == 'anim1' and getProperty('NMBendyJump.animation.curAnim.finished') then
    	removeLuaSprite('NMBendyJump')
    	cameraFlash('camHUD', 'E6FF00', 0.3)
    end

	if getProperty('NMSansJump.animation.curAnim.name') == 'anim1' and getProperty('NMSansJump.animation.curAnim.finished') then
    	removeLuaSprite('NMSansJump')
    end

	if getProperty('dad.animation.curAnim.name') == 'bye' and getProperty('dad.animation.curAnim.finished') then
    	setProperty('dad.alpha',0)
    end

    if curStep >= 1343 and curStep <= 1599 then
    	if curBeat % 2 == 0 then
    		playAnim('NMSansBG','anim1',true)
    	end
    end
end