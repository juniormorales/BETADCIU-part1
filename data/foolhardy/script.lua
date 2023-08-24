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

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'start' then
		makeLuaSprite('black', 'black', 0, 0);
		setObjectCamera('black', 'hud');
		addLuaSprite('black', true);
		runTimer('fadein', 1, 1);
		runTimer('fadeout', 17, 1);
	elseif tag == 'fadeout' then
		doTweenAlpha('blackfade', 'black', 0, 0.8, 'linear');
	end
end

function onTweenCompleted(tag)

	if tag == 'blackfade' then
		--removeLuaSprite('black')
	end

	if tag == 'snowsixFade' then
		removeLuaSprite('snowsix');
		removeLuaSprite('snowfive');
		removeLuaSprite('snowfour');
		removeLuaSprite('snowthree');
		removeLuaSprite('snowtwo');
		removeLuaSprite('snowone');
		removeLuaSprite('snowfall');
		removeLuaSprite('blueframe');
		doTweenAlpha('boyfriendFade','boyfriend',1,0.5,'linear')
		doTweenAlpha('dadFade','dad',1,0.5,'linear')

		addLuaSprite('room', false);
		addLuaSprite('bed',false);
		addLuaSprite('stars',false);
		addLuaSprite('lamp',false);
		addLuaSprite('table',false);
	end

	if tag == 'defeatTweenYEnter' then
		objectPlayAnimation('defeatBlack','kill')
	end

	if tag == 'tweenXMoveGfHx' then
		camNewPos = {getProperty('dad.cameraPosition')[1] + 400 , getProperty('dad.cameraPosition')[2]}
		setProperty('dad.cameraPosition', camNewPos);
	end
end

function createJumpscares()

	precacheImage('jumpscare/NightmareJumpscares01')
	precacheImage('background/uzi/blackscreen')

	makeAnimatedLuaSprite('NMCupheadJump', 'jumpscare/NightmareJumpscares01', -1150, -600)
	setProperty('NMCupheadJump.antialiasing', true)
	addAnimationByPrefix('NMCupheadJump', 'anim1', 'CupScare instance', 24, false)

	makeLuaSprite('blackscreen', 'background/uzi/blackscreen', -600, -300); 
	setScrollFactor('blackscreen', 0.3, 0.3);
	setObjectCamera('blackscreen', 'HUD');
	scaleObject('blackscreen', 1.5, 1.5);

	makeAnimatedLuaSprite('defeatBlack', 'characters/defeat_death', 100, 720);
    addAnimationByPrefix('defeatBlack', 'kill', 'black kill', 60, false);
    setProperty('defeatBlack.antialiasing', false);
    scaleObject('defeatBlack', 1, 1);
    setPropertyLuaSprite('defeatBlack', 'flipX', false);
end

function createMirrorStage()
	makeLuaSprite('mirror', 'background/mirrormode', -800, -300);
	setScrollFactor('mirror', 0.9, 0.9);
end

function createTooSlowStage()

	precacheImage('background/too slow/1back')
	precacheImage('background/too slow/2fire')
	precacheImage('background/too slow/3firewall')
	precacheImage('background/too slow/4plants')
	precacheImage('background/too slow/5rocks')
	precacheImage('background/too slow/6bushes')
	precacheImage('background/too slow/7ground')
	precacheImage('background/too slow/8foreground')

	makeLuaSprite('BGExe', 'background/too slow/1back', -900, -300);
	scaleObject('BGExe',1.3,1.3)

	makeLuaSprite('FireExe', 'background/too slow/2fire', -900, -300);
	scaleObject('FireExe',1.3,1.3)

	makeLuaSprite('FirewallExe', 'background/too slow/3firewall', -900, -300);
	scaleObject('FirewallExe',1.3,1.3)

	makeLuaSprite('plantsExe', 'background/too slow/4plants', -900, -400);
	scaleObject('plantsExe',1.2,1.2)

	makeLuaSprite('rocksExe', 'background/too slow/5rocks', -900, -400);
	scaleObject('rocksExe',1.2,1.2)

	makeLuaSprite('bushesExe', 'background/too slow/6bushes', -900, -400);
	scaleObject('bushesExe',1.2,1.2)

	makeLuaSprite('groundExe', 'background/too slow/7ground', -900, -400);
	scaleObject('groundExe',1.2,1.2)

	makeLuaSprite('fgExe', 'background/too slow/8foreground', -870, -500);
	scaleObject('fgExe',1.2,1.2)
end

function createDefeatStage()

	precacheImage('background/defeat/defeat')
	precacheImage('background/defeat/lol thing')
	precacheImage('background/defeat/deadBG')
	precacheImage('background/defeat/deadFG')
	precacheImage('background/defeat/iluminao omaga')

	makeAnimatedLuaSprite('defeatLight', 'background/defeat/defeat', -900, -300)
	setProperty('defeatLight.antialiasing', true)
	addAnimationByPrefix('defeatLight', 'anim1', 'defeat', 24, true)

	makeLuaSprite('defeatThing', 'background/defeat/lol thing', -900, 50);

	makeLuaSprite('defeatBG', 'background/defeat/deadBG', -800, 300);
	scaleObject('defeatBG',0.28,0.28)

	makeLuaSprite('deadFG', 'background/defeat/deadFG', -900, 600);
	scaleObject('deadFG',0.3,0.25)

	makeLuaSprite('defeatOverlay', 'background/defeat/iluminao omaga', -1100, -200);
	scaleObject('defeatOverlay',1.2,1.2)
end

function createNMCupheadStage()

	precacheImage('background/NMCuphead/nightmarecupbg')
	precacheImage('background/NMCuphead/CUpheqdshid')
	precacheImage('background/NMCuphead/NMClight')
	precacheImage('background/NMCuphead/Grainshit')

	makeLuaSprite('nightmarecupbg', 'background/NMCuphead/nightmarecupbg', -600, -200);
	setProperty('nightmarecupbg.scale.x',1.6)
	setProperty('nightmarecupbg.scale.y',1.6)
	setBlendMode('nightmarecupbg','add')

	makeLuaSprite('nightmarecupbg1', 'background/NMCuphead/nightmarecupbg', -600, -200);
    setProperty('nightmarecupbg1.scale.x',1.6)
    setProperty('nightmarecupbg1.scale.y',1.6)
    setBlendMode('nightmarecupbg1','multiply')

	makeAnimatedLuaSprite('CUpheqdshid', 'background/NMCuphead/CUpheqdshid', 0, 0);
	addAnimationByPrefix('CUpheqdshid','dance','Cupheadshit_gif instance',24,true)
	objectPlayAnimation('CUpheqdshid','dance', false)
	setObjectCamera('CUpheqdshid', 'hud')

	makeAnimatedLuaSprite('NMClight', 'background/NMCuphead/NMClight', -800, 0);
	addAnimationByPrefix('NMClight','dance','rgrrr instance',24,true)
	objectPlayAnimation('NMClight','dance', false)
	setBlendMode('NMClight','add')

	makeAnimatedLuaSprite('Grainshit','background/NMCuphead/Grainshit', 0, 0)
	addAnimationByPrefix('Grainshit','Cupheadshit_gif instance','Cupheadshit_gif instance',24,true)
    objectPlayAnimation('Grainshit','Geain instance',false)
    setObjectCamera('Grainshit','other')
    setBlendMode('Grainshit','lighten')
end

function createEndeavorsStage()

	precacheImage('background/endeavors/funScreen')
	precacheImage('background/endeavors/cd')
	precacheImage('background/endeavors/majin hottie')
	precacheImage('background/endeavors/Majin sign')
	precacheImage('background/endeavors/Sunglasses Majin')
	precacheImage('background/endeavors/Majin Twins')
	precacheImage('background/endeavors/Majin front')

    makeLuaSprite('funBG', 'background/endeavors/funScreen', -900, -200);
    scaleObject('funBG', 2.5, 2.5);

    makeLuaSprite('funCD', 'background/endeavors/cd', -450, 650);
	scaleObject('funCD', 3.3, 3.3);

	makeAnimatedLuaSprite('majinHottie', 'background/endeavors/majin hottie', 50, 80)
	setProperty('majinHottie.antialiasing', true)
	scaleObject('majinHottie',1.4,1.4)
	addAnimationByPrefix('majinHottie', 'anim1', 'Fem Majin idle', 24, true)

	makeAnimatedLuaSprite('majinSign', 'background/endeavors/Majin sign', 350, -300)
	setProperty('majinSign.antialiasing', true)
	scaleObject('majinSign',0.45,0.45)
	addAnimationByPrefix('majinSign', 'anim1', 'dance', 24, true)

	makeAnimatedLuaSprite('majinSunglasses', 'background/endeavors/Sunglasses Majin', -600, -100)
	setProperty('majinSunglasses.antialiasing', true)
	scaleObject('majinSunglasses',0.45,0.45)
	addAnimationByPrefix('majinSunglasses', 'anim1', 'sunglass dance', 24, true)

	makeAnimatedLuaSprite('majinTwins', 'background/endeavors/Majin Twins', 800, -170)
	setProperty('majinTwins.antialiasing', true)
	scaleObject('majinTwins',0.45,0.45)
	addAnimationByPrefix('majinTwins', 'anim1', 'Twins dance', 24, true)

	makeAnimatedLuaSprite('majinFront', 'background/endeavors/Majin front', 150, -135)
	setProperty('majinFront.antialiasing', true)
	scaleObject('majinFront',0.45,0.45)
	addAnimationByPrefix('majinFront', 'anim1', 'dance', 24, true)
end

function createUziStage()
    makeLuaSprite('blackscreen', 'background/uzi/blackscreen', -600, -300); 
	setScrollFactor('blackscreen', 0.3, 0.3);
	setObjectCamera('blackscreen', 'hud');
	scaleObject('blackscreen', 1.5, 1.5);

	makeAnimatedLuaSprite('uhoh','background/uzi/uhoh', 0, 0)
	addAnimationByPrefix('uhoh', 'idle', 'idle', 15, true)
	objectPlayAnimation('uhoh','idle',false)
	setObjectCamera('uhoh', 'HUD')
	scaleObject('uhoh', 1.0, 1.0);

		makeLuaSprite('snowsix', 'background/uzi/snowsix', -600, -300); 
	setScrollFactor('snowsix', 0.3, 0.3);

	makeLuaSprite('snowfive', 'background/uzi/snowfive', -500, -300);
	setScrollFactor('snowfive', 0.5, 0.5);
      scaleObject('snowfive', 0.9, 0.9);

	makeLuaSprite('snowfour', 'background/uzi/snowfour', -600, -300);
	setScrollFactor('snowfour', 0.6, 0.6);

	makeLuaSprite('snowthree', 'background/uzi/snowthree', -600, -300);
	setScrollFactor('snowthree', 0.8, 0.8);

	makeLuaSprite('snowtwo', 'background/uzi/snowtwo', -600, -300);
	setScrollFactor('snowtwo', 0.9, 0.9);

	makeLuaSprite('snowone', 'background/uzi/snowone', -600, -300);
	setScrollFactor('snowone', 1.0, 1.0);

	makeAnimatedLuaSprite('snowfall','background/uzi/snowfall', -50, -80)
	addAnimationByPrefix('snowfall', 'idle', 'idle', 24, true)
	objectPlayAnimation('snowfall','idle',false)
	setObjectCamera('snowfall', 'HUD')
	scaleObject('snowfall', 1.1, 1.1);

	makeLuaSprite('blueframe', 'background/uzi/blueframe', 0, 0);
	setScrollFactor('blueframe', 1.0, 1.0);
	setObjectCamera('blueframe', 'HUD')
end

function createTwinsonmiaStage()

	makeLuaSprite('roomBoogie', 'background/bedroom2/bedroom_backdrop_boogie', -520, -152);
	setLuaSpriteScrollFactor('roomscary', 1.0, 1.0);	

	makeLuaSprite('bedBoogie', 'background/bedroom2/bed_boogie', -27, 570);
	setLuaSpriteScrollFactor('bedscary', 1.0, 1.0);

 	makeLuaSprite('tableBoogie', 'background/bedroom2/bedside_table_boogie', -470, 440);
	setLuaSpriteScrollFactor('table', 1.2, 1.1);

	makeLuaSprite('lampBoogie', 'background/bedroom2/lamp_boogie', 1050, -142);
	setLuaSpriteScrollFactor('lamp', 1.1, 1.2);

   	makeAnimatedLuaSprite('beef','background/bedroom2/scared_lil_bitch', 300, 645)
    addAnimationByPrefix('beef','background/bedroom2/scared_lil_bitch','bf under bedsheets',24,true);
    objectPlayAnimation('beef','bedside table',false);
	setLuaSpriteScrollFactor('beef', 1.0, 1.0);

	makeLuaSprite('room', 'background/bedroom1/bedroom_backdrop', -567, -152);
	setLuaSpriteScrollFactor('room', 1.0, 1.0);	

	makeLuaSprite('bed', 'background/bedroom1/bed', 27, 570);
	setLuaSpriteScrollFactor('bed', 1.0, 1.0);

   	makeAnimatedLuaSprite('table','background/bedroom1/bedside_table', 1120, 460)
    addAnimationByPrefix('table','background/bedroom1/bedside_table','bedside table',24,true);
    objectPlayAnimation('table','bedside table',false);
	setLuaSpriteScrollFactor('table', 1.2, 1.1);

	makeLuaSprite('lamp', 'background/bedroom1/lamp', -106, -162);
	setLuaSpriteScrollFactor('lamp', 1.1, 1.2);

   	makeAnimatedLuaSprite('stars','background/bedroom1/the_cool_star_thing', 950, 250)
    addAnimationByPrefix('stars','stars','stars',24,false);
    objectPlayAnimation('stars','stars',false);
	setLuaSpriteScrollFactor('stars', 1.0, 1.0);
end

function createQTStage()
	makeLuaSprite('streetBackCute', 'background/qt/streetBackCute', -600, -300);
	setScrollFactor('streetBackCute', 0.9, 0.9);
	
	makeLuaSprite('streetFrontCute', 'background/qt/streetFrontCute', -650, 600);
	setScrollFactor('streetFrontCute', 0.9, 0.9);
	scaleObject('stageFrontCute', 1.1, 1.1);

	makeAnimatedLuaSprite('tvWarning', 'background/qt/TV_V4', -50, 450)
	setProperty('tvWarning.antialiasing', true)
	scaleObject('tvWarning',1.1,1.1)
	addAnimationByPrefix('tvWarning', 'anim1', 'TV_Attention', 24, true)
end

function createDeathTollStage()
	makeLuaSprite('floorDT', 'background/deathtoll/floor', -810, 560);
	scaleObject('floorDT', 1, 1);
	
	makeLuaSprite('wallDT', 'background/deathtoll/wall', -806, -68);
	scaleObject('wallDT', 1,1);
	
	makeLuaSprite('rocksDT', 'background/deathtoll/rocks', -746, 696);
	scaleObject('rocksDT', 1, 0.9);
	
	makeLuaSprite('floorbotDT', 'background/deathtoll/floorbot', -100, 696);
	scaleObject('floorbotDT', 1,1);

	makeLuaSprite('pilforDT', 'background/deathtoll/pilfor', 599, 780);
	scaleObject('pilforDT', 0.9, 1);
	
    makeLuaSprite('pilDT', 'background/deathtoll/pil', -250, 310);
	scaleObject('pilDT', 1,1);
	
	makeAnimatedLuaSprite('HellBell','background/deathtoll/HellBell',-50,289)
	scaleObject('HellBell', 0.45, 0.45)
	addAnimationByPrefix('HellBell','dance','BellIdle',24,true)
	addAnimationByPrefix('HellBell','bellin','BongLmao',24,false)
end

function createManiacalVengeanceStage()
	makeLuaSprite('Maniacalbg','background/maniacal/bg', -800, -600)
	scaleObject('Maniacalbg',0.9,0.9)
	makeLuaSprite('OV','background/maniacal/overlay', -500, -1000)
	makeLuaSprite('DarkSC','background/maniacal/DarkSC', 0, 0)

	setBlendMode('OV', 'MULTIPLY')
	setProperty('OV.alpha', 1);
	
	setObjectCamera('DarkSC', 'other');
	setProperty('DarkSC.alpha', 0.75);
	setObjectCamera('OV', 'other');
end

function createPixelStage()
	makeLuaSprite('pixelSky','background/pixel/weebSky', -900, -100)
	scaleObject('pixelSky',5,5)
	makeLuaSprite('pixelStreet','background/pixel/weebStreet', -900, -100)
	scaleObject('pixelStreet',5,5)
	makeLuaSprite('pixelSchool','background/pixel/weebSchool',-900, -100)
	scaleObject('pixelSchool',5,5)
	makeLuaSprite('pixelTreesBack','background/pixel/weebTreesBack',-900, -100)
	scaleObject('pixelTreesBack',5,5)

	makeAnimatedLuaSprite('pixelTrees', 'background/pixel/weebTrees', -900, -100)
	setProperty('pixelTrees.antialiasing', false)
	addAnimationByPrefix('pixelTrees', 'iddle', 'trees', 24, true)
	scaleObject('pixelTrees',5,5)

	makeAnimatedLuaSprite('pixelEvilSchool', 'background/pixel/animatedEvilSchool', -1900, -1100)
	setProperty('pixelEvilSchool.antialiasing', false)
	addAnimationByPrefix('pixelEvilSchool', 'iddle', 'background 2 instance', 24, true)
	scaleObject('pixelEvilSchool',5,5)
end

function onCreate()

	setObjectOrder('gfGroup', getObjectOrder('dadGroup'));

	-- JUMPSCARES
	--createJumpscares();

	-- PS135 STAGE
	--createMirrorStage();

	-- TOO SLOW STAGE
	--createTooSlowStage();

	-- DEFEAT STAGE
	--createDefeatStage();


	-- NIGHTMARE CUPHEAD STAGE
	--createNMCupheadStage();

    -- ENDEAVORS STAGE
    --createEndeavorsStage();

    -- UZI STAGE
	--createUziStage();

	--TWINSONMIA STAGES
	--createTwinsonmiaStage();

	-- QT STAGE
	createQTStage();

	--DEATH TOLL STAGE
	createDeathTollStage()

	--MANICAL STAGE
	createManiacalVengeanceStage();

	--PIXEL STAGE
	createPixelStage();
end

function onUpdate(elapsed)

	if curStep == 361 then
		playSound('static',1)
	end

	if curStep == 366 then
		addLuaSprite('mirror', false);
		removeLuaSprite('ground')
		removeLuaSprite('lila')
		removeLuaSprite('far')
		removeLuaSprite('clouds')
		removeLuaSprite('BG')
		removeLuaSprite('overlay')
	end

	if curStep == 383 then
		addLuaSprite('luigi-mirror',true)
		addLuaSprite('yoshi-mirror',false)
	end

	if curStep == 512 then
		removeLuaSprite('mirror')
		removeLuaSprite('luigi-mirror')
		removeLuaSprite('yoshi-mirror')

		addLuaSprite('BGExe',false)
		addLuaSprite('FireExe',false)
		addLuaSprite('FirewallExe',false)
		addLuaSprite('plantsExe',false)
		addLuaSprite('rocksExe',false)
		addLuaSprite('bushesExe',false)
		addLuaSprite('groundExe',false)
		addLuaSprite('fgExe',true)

	end

	if curStep == 612 then 
		addLuaSprite('defeatBlack',true)
		doTweenY('defeatTweenYEnter', 'defeatBlack', getProperty('defeatBlack.y') - 400, 0.9, 'elasticinout')
	end

	if curStep == 750 then
		addLuaSprite('NMCupheadJump',true)
		playAnim('NMCupheadJump', 'anim1', true)
	end

	if curStep == 751 then
		playSound('NMCupheadJumpscare')
	end

	if curStep == 767 then
		removeLuaSprite('NMCupheadJump');
		cameraFlash('hud', 'E8A2AD', 0.8)

		removeLuaSprite('defeatLight')
		removeLuaSprite('defeatThing')
		removeLuaSprite('defeatBG')
		removeLuaSprite('deadFG')
		removeLuaSprite('defeatOverlay')

		addLuaSprite('Grainshit', true)
		addLuaSprite('nightmarecupbg', false);
		addLuaSprite('nightmarecupbg1', false);
		addLuaSprite('CUpheqdshid', true);
		addLuaSprite('NMClight', true);
	end

	if curStep == 887 then
		removeLuaSprite('Grainshit')
		removeLuaSprite('nightmarecupbg');
		removeLuaSprite('nightmarecupbg1');
		removeLuaSprite('CUpheqdshid');
		removeLuaSprite('NMClight');
	end

	if curStep == 1018 then
		cameraFlash('hud', '0050D2', 1.2)
		playSound('warpsound')

		addLuaSprite('funBG',false)
		addLuaSprite('funCD',false)
		addLuaSprite('majinHottie',false)
		playAnim('majinHottie','anim1',true)
		addLuaSprite('majinSign',false)
		playAnim('majinSign','anim1',true)
		addLuaSprite('majinSunglasses',false)
		playAnim('majinSunglasses','anim1',true)
		addLuaSprite('majinTwins',false)
		playAnim('majinTwins','anim1',true)
		addLuaSprite('majinFront',false)
		playAnim('majinFront','anim1',true)
	end

	if curStep == 1138 then	
		addLuaSprite('blackscreen', false)
		addLuaSprite('uhoh', false)
	end

	if curStep == 1148 then
		removeLuaSprite('funBG')
		removeLuaSprite('funCD')
		removeLuaSprite('majinHottie')
		removeLuaSprite('majinSign')
		removeLuaSprite('majinSunglasses')
		removeLuaSprite('majinTwins')
		removeLuaSprite('majinFront')
	end

	if curStep == 1152 then
		playSound('swoop')
		removeLuaSprite('blackscreen')
		removeLuaSprite('uhoh')

		addLuaSprite('snowsix', false);
		addLuaSprite('snowfive', false);
		addLuaSprite('snowfour', false);
		addLuaSprite('snowthree', false);
		addLuaSprite('snowtwo', false);
		addLuaSprite('snowone', false);
		addLuaSprite('snowfall', true);
		addLuaSprite('blueframe', true);
		cameraFlash('camHUD', '0xFFFFFFFF', 0.8)
	end

	if curStep == 1279 then
		doTweenAlpha('snowsixFade', 'snowsix', 0, 0.5, 'linear');
		doTweenAlpha('snowfiveFade', 'snowfive', 0, 0.5, 'linear');
		doTweenAlpha('snowfourFade', 'snowfour', 0, 0.5, 'linear');
		doTweenAlpha('snowthreeFade', 'snowthree', 0, 0.5, 'linear');
		doTweenAlpha('snowtwoFade', 'snowtwo', 0, 0.5, 'linear');
		doTweenAlpha('snowoneFade', 'snowone', 0, 0.5, 'linear');
		doTweenAlpha('blueframeFade', 'blueframe', 0, 0.5, 'linear');
		--doTweenAlpha('boyfriendFade','boyfriend',0,0.5,'linear')
		--doTweenAlpha('dadFade','dad',0,0.5,'linear')
		setProperty('girlfriend.alpha',0)
	end

	if curStep == 1387 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.7)
		removeLuaSprite('room');
		removeLuaSprite('bed');
		removeLuaSprite('stars');
		removeLuaSprite('lamp');
		removeLuaSprite('table');

		addLuaSprite('roomBoogie', false);
		addLuaSprite('bedBoogie',false);
		addLuaSprite('tableBoogie',false);
		addLuaSprite('lampBoogie',false);
		addLuaSprite('beef',false);
	end

	if curStep == 1423 then
		removeLuaSprite('roomBoogie');
		removeLuaSprite('bedBoogie');
		removeLuaSprite('tableBoogie');
		removeLuaSprite('lampBoogie');
		removeLuaSprite('beef');

		cameraFlash('camHUD', '0xFFFFFFFF', 0.8)

		addLuaSprite('streetBackCute',false)
		addLuaSprite('streetFrontCute',false)
		addLuaSprite('tvWarning',false)
		playAnim('tvWarning','anim1',true)
	end

	if curStep == 1583 then
		removeLuaSprite('streetBackCute')
		removeLuaSprite('streetFrontCute')
		removeLuaSprite('tvWarning')
		cameraFlash('camHUD', '0xFFFFFFFF', 0.8)

		addLuaSprite('wallDT', false);
		addLuaSprite('floorbotDT', false);
		addLuaSprite('rocksDT', false);
		addLuaSprite('floorDT', false);
		addLuaSprite('HellBell', false);
		addLuaSprite('pilforDT', false);
		addLuaSprite('pilDT', false);
	end

	if curStep == 1600 then
		playAnim('HellBell','bellin',true)
		triggerEvent("Screen Shake", "0.3, 0.01", "0.2, 0.01")
		playSound('bell')
	end

	if curStep == 1616 then
		playAnim('HellBell','bellin',true)
		triggerEvent("Screen Shake", "0.3, 0.01", "0.2, 0.01")
		playSound('bell')
	end

	if curStep == 1632 then
		playAnim('HellBell','bellin',true)
		triggerEvent("Screen Shake", "0.3, 0.01", "0.2, 0.01")
		playSound('bell')
	end

	if curStep == 1648 then
		playAnim('HellBell','bellin',true)
		triggerEvent("Screen Shake", "0.3, 0.01", "0.2, 0.01")
		playSound('bell')
	end

	if curStep == 1664 then
		playAnim('HellBell','bellin',true)
		triggerEvent("Screen Shake", "0.3, 0.01", "0.2, 0.01")
		playSound('bell')
	end

	if curStep == 1680 then
		playAnim('HellBell','bellin',true)
		triggerEvent("Screen Shake", "0.3, 0.01", "0.2, 0.01")
		playSound('bell')
	end

	if curStep == 1696 then
		playAnim('HellBell','bellin',true)
		triggerEvent("Screen Shake", "0.3, 0.01", "0.2, 0.01")
		playSound('bell')
	end

	if curStep == 1711 then
		removeLuaSprite('wallDT');
		removeLuaSprite('floorbotDT');
		removeLuaSprite('rocksDT');
		removeLuaSprite('floorDT');
		removeLuaSprite('HellBell');
		removeLuaSprite('pilforDT');
		removeLuaSprite('pilDT');

		cameraFlash('camHUD', '0xFFFFFFFF', 0.8)
		addLuaSprite('Maniacalbg',false)
		addLuaSprite('OV', true)
		addLuaSprite('DarkSC', true)
	end

	if curStep == 1839 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.8)
		removeLuaSprite('Maniacalbg')
		removeLuaSprite('OV')
		removeLuaSprite('DarkSC')
		addLuaSprite('cassier', true)
		addLuaSprite('pixel', true)
	end

	if curStep == 1890 then
		doTweenX('tweenXEnterCassie', 'cassier', getProperty('cassier.x') -1100, 1, 'quadOut');
		doTweenX('tweenXEnterPixel', 'pixel', getProperty('pixel.x') -1100, 1, 'quadOut');
		doTweenX('tweenXMoveGfHx','dad',getProperty('dad.x')-400,0.4,'quadOut');
	end

	if curStep == 2100 then
		doTweenX('rightTweenXLeaveAi','ai', getProperty('ai.x') + 400 , 0.7, 'cubeout');
		doTweenY('rightTweenYLeaveAi', 'ai', getProperty('ai.y') + 400, 0.7, 'cubeout');
		doTweenX('rightTweenXLeavePanel','bottomrightpanel', getProperty('bottomrightpanel.x') + 400 , 0.7, 'cubeout');
		doTweenY('rightTweenYLeavePanel', 'bottomrightpanel', getProperty('bottomrightpanel.y') + 400, 0.7, 'cubeout');
		doTweenX('tweenXLeaveCassie', 'cassier', getProperty('cassier.x') +1100, 1, 'quadOut');
		doTweenX('tweenXLeavePixel', 'pixel', getProperty('pixel.x') +1100, 1, 'quadOut');
		doTweenY('tweenYLeaveTails','tailsdoll1',getProperty('tailsdoll1.y')+500,0.7,'quadOut')
	end

	if curStep == 2095 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.8)
		addLuaSprite('pixelSky',false)
		addLuaSprite('pixelSchool',false)
		addLuaSprite('pixelTreesBack',false)
		addLuaSprite('pixelStreet',false)
		addLuaSprite('pixelTrees',false)
	end

	if curStep == 2223 then
		cameraFlash('camHUD', '0xFFFFFFFF', 0.8)
		removeLuaSprite('pixelSky')
		removeLuaSprite('pixelSchool')
		removeLuaSprite('pixelTreesBack')
		removeLuaSprite('pixelStreet')
		removeLuaSprite('pixelTrees')
		addLuaSprite('pixelEvilSchool',false)
	end

	if curStep == 2350 then
		doTweenAlpha('blackin', 'black', 1, 0.8, 'linear');
	end
end


function onBeatHit()
    if getProperty('defeatBlack.animation.curAnim.name') == 'kill' and getProperty('defeatBlack.animation.curAnim.finished') then
        removeLuaSprite('defeatBlack')
        playSound('amongkill')
        cameraFlash('camHUD', '0xFFFFFFFF', 0.8)
        removeLuaSprite('BGExe')
		removeLuaSprite('FireExe')
		removeLuaSprite('FirewallExe')
		removeLuaSprite('plantsExe')
		removeLuaSprite('rocksExe')
		removeLuaSprite('bushesExe')
		removeLuaSprite('groundExe')
		removeLuaSprite('fgExe')

		addLuaSprite('defeatLight',false)
		playAnim('defeatLight', 'anim1', true)
		addLuaSprite('defeatThing',false)
		addLuaSprite('defeatBG',false)
		addLuaSprite('deadFG',true)
		addLuaSprite('defeatOverlay',true)
    end

    if getProperty('HellBell.animation.curAnim.name') == 'bellin' and getProperty('HellBell.animation.curAnim.finished') then
    	playAnim('HellBell','dance',true)
    end
end