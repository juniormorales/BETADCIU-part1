
local xx = 400
local yy = 380
local xx2 = 220;
local yy2 = 380;
local xx3 = 1300;
local yy3 = 350;
local ofs = 20;
local ofs2 = 120;
local followchars = true;

local xPos = 0;
local yPos = 0;

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
        runTimer('fadein', 0.5, 1);
        runTimer('fadeout', 3, 1);
    elseif tag == 'fadeout' then
        doTweenAlpha('blackfade', 'black', 0, 1.5, 'linear');
    end
end

function onTweenCompleted(tag)
    if tag == 'blackfade3' then
        setProperty('lightExe.alpha',0)
    end

    if tag == 'leaveAnti_Piracy' then
        removeLuaSprite('sunshinep2')
        removeLuaSprite('sunshineTails')
        removeLuaSprite('pixel3')
        removeLuaSprite('hyperBG2')
        removeLuaSprite('pixel4')
        removeLuaSprite('hypersonic')
        removeLuaSprite('anti_piracy_2')
        removeLuaSprite('piracyBG1')
        removeLuaSprite('pixel2')
        removeLuaSprite('googleBG')
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
    end

    if tag == 'closeBarTop' then
        doTweenY('leaveBarTop','topBar', getProperty('topBar.y') -1000, 0.5, 'cubeout');
        doTweenY('leaveBarBottom','bottomBar', getProperty('bottomBar.y') + 1000, 0.5, 'cubeout');
    end

    if tag == 'leaveBarBottom' then
        removeBars();
    end
end

function createStageZalgo()
    precacheImage('background/sunshine/sunshinefg')

    makeAnimatedLuaSprite('sunshinefg','background/sunshine/sunshinefg', 45, 245)
    addAnimationByPrefix('sunshinefg','sunshinefg','lastchancetailsbg3 2 loop',12,true);
    objectPlayAnimation('sunshinefg','lastchancetailsbg3 2 loop',false);
    setProperty('sunshinefg.antialiasing', false)
    setProperty('sunshinefg.visible', true)
    scaleObject('sunshinefg', 1, 1)
end

function addStageZalgo()
    addLuaSprite('sunshinefg', false);
    removeLuaSprite('sunshinestart', false);
    function onBeatHit(beat)
        if (curBeat % 2 == 0) then
        objectPlayAnimation('sunshinefg','emptyspring',true)
        end
    end
end

function createSunshineExeStage()
    precacheImage('background/sunshine/sunshinep2')

    makeAnimatedLuaSprite('sunshinep2','background/sunshine/sunshinep2', 250, -180)
    addAnimationByPrefix('sunshinep2','sunshinep2','switch',2,true);
    objectPlayAnimation('sunshinep2','switch',false);
    setProperty('sunshinep2.antialiasing', false)
    scaleObject('sunshinep2', 2.1, 2.3)
end

function createPiracyHeadBG()
    precacheImage('pixelthing')

    makeLuaSprite('vignete', 'black', 2230, -250);
    scaleObject('vignete',2,2)

    makeAnimatedLuaSprite('pixel1', 'pixelthing', 900, -200) -- -1725 x
    addAnimationByPrefix('pixel1', 'idle', 'pixelthing', 24, true)
    scaleObject('pixel1', 2.1, 2)

end

function addSunshineExeStage()
    addLuaSprite('sunshinep2', false);

    function onBeatHit(beat)
        if (curStep % 2 == 2) then
        objectPlayAnimation('sunshinep2','switch',true)
        end
    end
end

function removeSunshineStage()
    removeLuaSprite('sunshinep2')
    removeLuaSprite('pixel1')
    removeLuaSprite('vignete')
    removeLuaSprite('piracy_head')
end

function fadeSunshineStage()
    setProperty('sunshinep2.alpha',0)
    removeLuaSprite('pixel1')
    removeLuaSprite('vignete')
    removeLuaSprite('piracy_head')
end

function createTooSlowStage()

    precacheImage('background/too slow/1back')
    precacheImage('background/too slow/fake/light')

    makeLuaSprite('BGExe', 'background/too slow/1back', -730, -250);
    makeLuaSprite('fgExe', 'background/too slow/8foreground', -870, -500);
    scaleObject('fgExe',1.2,1.2)

    makeLuaSprite('lightExe', 'background/too slow/fake/light', -100, -300);
    scaleObject('lightExe',1.1,1.1)

    makeLuaSprite('jumpscare1', 'background/too slow/jumpscare/jc_1', 140, -200);
end

function addTooSlowStage()
    addLuaSprite('BGExe',false)
    addLuaSprite('fgExe',true)
    addLuaSprite('lightExe',false)
    setProperty('lightExe.alpha',0)
end

function fadeTooSlowStage()
    setProperty('BGExe.alpha',0)
    setProperty('fgExe.alpha',0)
end

function showTooSlowStage()
    setProperty('BGExe.alpha',1)
    setProperty('fgExe.alpha',1)
end

function removeTooSlowStage()
    removeLuaSprite('BGExe')
    removeLuaSprite('fgExe')
end

function createBarBlacks()
    precacheImage('black')
    makeLuaSprite('topBar', 'black', -700, -750); -- -500
    scaleObject('topBar',2,0.7)

    makeLuaSprite('bottomBar', 'black', -700, 1200);-- +500
    scaleObject('bottomBar',2,0.7)
end

function addBars()
    addLuaSprite('topBar',true)
    addLuaSprite('bottomBar',true)
end

function removeBars()
    removeLuaSprite('topBar',false)
    removeLuaSprite('bottomBar',false)
end

function moveBarsEnter()
    doTweenY('moveTopBar','bottomBar', getProperty('bottomBar.y') - 360, 0.5, 'cubeout');
    doTweenY('moveBottomBar','topBar', getProperty('topBar.y') + 360, 0.5, 'cubeout');
end

function moveBarsOut()
    doTweenY('moveTopBar','bottomBar', getProperty('bottomBar.y') + 360, 0.5, 'cubeout');
    doTweenY('moveBottomBar','topBar', getProperty('topBar.y') - 360, 0.5, 'cubeout');
end

function createHyperStage()
    precacheImage('background/hyper/bg')

    makeLuaSprite('hyperBG', 'background/hyper/bg', -400, -300);
end

function addHyperStage()
    addLuaSprite('hyperBG',false)

end

function removeHyperStage()
    removeLuaSprite('hyperBG',false)
end

function createHyper2Stage()
    precacheImage('background/hyper/bg2')

    makeLuaSprite('hyperBG2', 'background/hyper/bg2', 1650, 400);
    makeAnimatedLuaSprite('pixel4', 'pixelthing', 150, 400) -- -1725 x
    addAnimationByPrefix('pixel4', 'idle', 'pixelthing', 24, true)
    scaleObject('pixel4', 2.1, 2)
end

function addHyper2Stage()
    addLuaSprite('hyperBG2',true)
    addLuaSprite('pixel4',true)
end

function removeHyper2Stage()
    removeLuaSprite('hyperBG2')
end

function createPiracyStageFirst()
    precacheImage('background/antipiracy/piracy_bg2')

    makeLuaSprite('piracyFloor', 'background/antipiracy/piracy_bg2', -600, 720);
end

function addPiracyStageFirst()
    addLuaSprite('piracyFloor',false)
end

function removePiracyStageFirst()
    removeLuaSprite('piracyFloor')
end

function createGoogleStage()
    precacheImage('background/google/SonicGoogleBG')

    makeAnimatedLuaSprite('googleBG','background/google/SonicGoogleBG', -700, -300)
    addAnimationByPrefix('googleBG','anim','Idle',2,true);
    objectPlayAnimation('googleBG','anim',false);
    setProperty('googleBG.antialiasing', false);
    scaleObject('googleBG',2.2,2.2)
end

function addGoogleStage()
    addLuaSprite('googleBG',false)
end

function removeGoogleStage()
    removeLuaSprite('googleBG',false)
end

function createPiracyStageSecond()
    precacheImage('background/antipiracy/piracy_bg1')

    makeLuaSprite('piracyBG1', 'background/antipiracy/piracy_bg1', 1500, -300);

    makeAnimatedLuaSprite('pixel2', 'pixelthing', 150, -150) -- -1725 x
    addAnimationByPrefix('pixel2', 'idle', 'pixelthing', 24, true)
    scaleObject('pixel2', 2.1, 2)
end

function addPiracyStageSecond()
    addLuaSprite('piracyBG1',false)
    addLuaSprite('pixel2',false)
end

function createLordXStage()
    precacheImage('background/lordx/dead_split')
    precacheImage('background/lordx/dead_split_1')
    precacheImage('background/lordx/dead_split_2')

     makeLuaSprite('tormentBG', 'background/lordx/dead_split', -500, -150);
     scaleObject('tormentBG',0.75,0.75)
     makeLuaSprite('splitDad', 'background/lordx/dead_split_1', -600, -200);
     scaleObject('splitDad',0.8,0.8)
     makeLuaSprite('splitBF', 'background/lordx/dead_split_2', -550, -200);
     scaleObject('splitBF',0.8,0.8)
end

function addLordXStage()
    addLuaSprite('tormentBG',true)
    addLuaSprite('splitDad',false)
    addLuaSprite('splitBF',false)
    setObjectOrder('splitDad',getObjectOrder('tormentBG') + 3)
    setObjectOrder('dad',getObjectOrder('tormentBG') + 4)
end

function createReroyStage()
    precacheImage('background/reroy/bg')

    makeLuaSprite('reroyBG', 'background/reroy/bg', -1050, -740);
    scaleObject('reroyBG',0.9,0.9)
end

function addReroyStage()
    addLuaSprite('reroyBG',false)
end

function removeReroyStage()
    removeLuaSprite('reroyBG')
end

function onCreate()

    addCharacterToList('zalgotails', 'dad')
    addCharacterToList('beastzalgotails2', 'dad')
    addCharacterToList('sunshineExe', 'dad')
    addCharacterToList('scrimbo', 'dad')
    addCharacterToList('rerun-bf-2', 'boyfriend')
    addCharacterToList('fakescrimbo', 'boyfriend')
    addCharacterToList('bfh2', 'boyfriend')
    addCharacterToList('hyper', 'dad')
    addCharacterToList('piracy-sonic', 'dad')
    addCharacterToList('googleSonic', 'dad')
    addCharacterToList('fakescrimbo2', 'dad')
    addCharacterToList('lordx', 'dad')
    addCharacterToList('rerun-bf-3', 'boyfriend')
    addCharacterToList('reroyfnfreal', 'dad')
    addCharacterToList('rebf', 'boyfriend')

    for i = 0, getProperty('unspawnNotes.length')-1 do
        setPropertyFromGroup('unspawnNotes', i, 'texture', 'StaticNote');
    end

    for i=0,4,1 do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'StaticNote');
        setPropertyFromGroup('playerStrums', i, 'texture', 'StaticNote');
    end

    precacheSound('simplejumpsound')
    precacheSound('werror')
    precacheSound('week_5')

    setTextString('botplayTxt','')
    setProperty('scoreTxt.visible', false);
    createStageZalgo()
    createSunshineExeStage()
    createPiracyHeadBG()
    createTooSlowStage()
    createBarBlacks()
    createHyperStage()
    createPiracyStageFirst()
    createGoogleStage()
    createPiracyStageSecond()
    createHyper2Stage()
    createLordXStage()
    createReroyStage()
    setProperty('healthBar.alpha', 0);
    setProperty('iconP1.alpha', 0);
    setProperty('iconP2.alpha', 0);
end

function onUpdate()

    if curStep >= 335 and curStep <= 516 then
        playSound('simplejumpsound', 0.21)
    end

    if curStep == 514 then
        setProperty('black.alpha',1)
        addStageZalgo();
    end

    if curStep == 526 then
        setProperty('black.alpha',0)

    end

    if curStep == 911 then
        addSunshineExeStage()
        removeLuaSprite('anti_piracy_1')
    end

    if curStep == 880 then
        addLuaSprite('anti_piracy_1',false)
        doTweenY('moveUpAntiPiracy','anti_piracy_1', getProperty('anti_piracy_1.y') - 150, 0.8, 'cubeout');
        setObjectOrder('anti_piracy_1',getObjectOrder('sunshinefg') -1);
    end

    if curStep == 911 then
        addLuaSprite('vignete',false)
        addLuaSprite('pixel1',false)
        playAnim('pixel1','idle',true)
        addLuaSprite('piracy_head',true)

        removeLuaSprite('sunshinefg')
        removeLuaSprite('sunshinebg')
        setProperty('boyfriend.alpha',0)
    end

    if curStep == 940 then
        doTweenX('moveLeftSunshine','dad', getProperty('dad.x') - 300, 1, 'cubeout');
        doTweenX('moveLeftBG','sunshinep2', getProperty('sunshinep2.x') - 300, 1, 'cubeout');
        doTweenX('moveLeftPiracyHead','piracy_head', getProperty('piracy_head.x') - 600, 1, 'cubeout');
        doTweenX('moveLeftBGPiracy','vignete', getProperty('vignete.x') - 800, 1, 'cubeout');
        doTweenX('moveLeftPixel1','pixel1', getProperty('pixel1.x') - 800, 1, 'cubeout');
    end

    if curStep >= 888 and curStep <= 911 then

        triggerEvent('Camera Follow Pos',350,290)

    elseif (curStep > 911 and curStep <= 1295) or (curStep >= 2543 and curStep <= 3216)  then
        followCharPov();
    elseif (curStep >= 1696 and curStep <= 1871) or (curStep >= 2543 and curStep <= 2639) or (curStep >= 3888 and curStep <= 3968) then

    else
        followChar();
    end

    if curStep == 1295 then
        fadeSunshineStage()
        addTooSlowStage()
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
        setProperty('boyfriend.alpha',1)
        xx = 300
        yy = 400
        xx2 = 550
        yy2 = 400
        ofs = 120

        addBars()
    end

    if curStep == 1731 then
        moveBarsEnter()
    end

    if curStep == 1867 then
        doTweenY('closeBarTop','topBar', getProperty('topBar.y') +200, 0.5, 'cubeout');
        doTweenY('closeBarBottom','bottomBar', getProperty('bottomBar.y') - 200, 0.5, 'cubeout');
    end

    if curStep == 1871 then
        fadeTooSlowStage()
        setProperty('lightExe.alpha',1)
        setProperty('dad.alpha',0)
        xx2 = 350
        yy2 = 400
        ofs = 40
    end

    if curStep == 2064 then
        doTweenAlpha('blackfade3', 'black', 1, 1, 'linear');
    end

    if curStep == 2128 then
        doTweenAlpha('blackfade4', 'black', 0, 1, 'linear');
        setProperty('dad.alpha',1)
        addHyperStage()

        xx = 850
        yy = 300
        xx2 = 800
        yy2 = 500
        ofs = 100
    end

    if curStep == 2436 then
        playSound('werror')

        makeLuaSprite('piracyError', 'Piracy_Error', 0, 0);
        setObjectCamera('piracyError', 'other');
        addLuaSprite('piracyError', true);
        addLuaSprite('piracybf',false)

        xPos = getProperty('piracybf.x');
        yPos = getProperty('piracybf.y');

        setProperty('boyfriend.alpha',0)
        removeHyperStage()
    end

    if curStep == 2449 then
        removeLuaSprite('piracyError')
        addPiracyStageFirst()
        xx = 200
        yy = 400
        xx2 = 300
        yy2 = 400
        ofs = 150
    end

    if curStep >=2447 and curStep <= 2800 then --2495
        followPiracy()
    end

    if curStep == 2496 then
        ofs = 80
    end

    if curStep == 2543 then
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
        removePiracyStageFirst()
        removeLuaSprite('piracybf')
        addGoogleStage();
        xx3 = 475
        yy3 = 400
        ofs2 = 20
        ofs = 150
    end

    if curStep == 2639 then
        addPiracyStageSecond()
        addLuaSprite('anti_piracy_2',true)
        doTweenX('moveLeftGoogle','dad', getProperty('dad.x') - 300, 1, 'cubeout');
        doTweenX('moveLeftGoogleBG','googleBG', getProperty('googleBG.x') - 300, 1, 'cubeout');
        doTweenX('moveLeftPiracyBG1','piracyBG1', getProperty('piracyBG1.x') - 850, 1, 'cubeout');
        doTweenX('moveLeftAnti_Piracy','anti_piracy_2', getProperty('anti_piracy_2.x') - 850, 1, 'cubeout');
        doTweenX('moveLeftPixel2','pixel2', getProperty('pixel2.x') - 830, 1, 'cubeout');
    end

    if curStep == 2730 then
        setProperty('sunshinep2.x',-1000)
        setProperty('sunshinep2.y',1000)
        setProperty('sunshinep2.alpha',1)
        scaleObject('sunshinep2',2.5,2.3)

        makeAnimatedLuaSprite('pixel3', 'pixelthing', -800, -430) -- -1725 x
        addAnimationByPrefix('pixel3', 'idle', 'pixelthing', 24, true)
        scaleObject('pixel3', 2.1, 4)
        addLuaSprite('pixel3',true)
        addHyper2Stage()
        addLuaSprite('hypersonic',true)
        setObjectOrder('hypersonic',getObjectOrder('pixel3'))
        setProperty('pixel3.angle',90)

        setObjectOrder('sunshinep2',getObjectOrder('dad') +100)

        addLuaSprite('sunshineTails',true)
        setObjectOrder('sunshineTails',getObjectOrder('pixel3'));

        doTweenY('moveUpGoogle','dad', getProperty('dad.y') - 300, 1, 'cubeout');
        doTweenY('moveUpGoogleBG','googleBG', getProperty('googleBG.y') - 300, 1, 'cubeout');
        
        doTweenY('moveUpAnti_Piracy','anti_piracy_2', getProperty('anti_piracy_2.y') - 400, 1, 'cubeout');
        doTweenY('moveUpPiracyBG1','piracyBG1', getProperty('piracyBG1.y') - 400, 1, 'cubeout');
        
        doTweenY('moveUpSunshine','sunshinep2', getProperty('sunshinep2.y') - 600, 1, 'cubeout');
        doTweenY('moveUpPixel3','pixel3', getProperty('pixel3.y') - 600, 1, 'cubeout');
        doTweenY('moveUpSunshineTails','sunshineTails', getProperty('sunshineTails.y') - 600, 1, 'cubeout');
    end

    if curStep == 2829 then
        doTweenX('moveLeftSunshine2','sunshinep2', getProperty('sunshinep2.x') - 500, 1, 'cubeout');
        doTweenX('moveLeftSunshineTails','sunshineTails', getProperty('sunshineTails.x') - 500, 1, 'cubeout');

        doTweenX('moveLeftHyperBG','hyperBG2', getProperty('hyperBG2.x') - 975, 1, 'cubeout');
        doTweenX('moveLeftPixel4','pixel4', getProperty('pixel4.x') - 830, 1, 'cubeout');
        doTweenX('moveLeftHyperSonic','hypersonic', getProperty('hypersonic.x') - 830, 1, 'cubeout');
    end

    if curStep == 3216 then
        doTweenY('leaveSunshine2','sunshinep2', getProperty('sunshinep2.y') + 2000, 1, 'elasticinout');
        doTweenY('leaveSunshineTails','sunshineTails', getProperty('sunshineTails.y') + 2000, 1, 'elasticinout');

        doTweenX('leaveHyperBG','hyperBG2', getProperty('hyperBG2.x') +2000, 1, 'elasticinout');
        doTweenX('leaveHyperSonic','hypersonic', getProperty('hypersonic.x') + 2000, 1, 'elasticinout');

        doTweenX('leaveAnti_Piracy','anti_piracy_2', getProperty('anti_piracy_2.x') +2000, 1, 'elasticinout');
        doTweenX('leavePiracyBG1','piracyBG1', getProperty('piracyBG1.x')+ 2000, 1, 'elasticinout');

        doTweenX('leaveGoogle','dad', getProperty('dad.x') - 2000, 1, 'elasticinout');
        doTweenX('leaveGoogleBG','googleBG', getProperty('googleBG.x') - 2000, 1, 'elasticinout');
    end

    if curStep == 3232 then

        xx = 475
        yy = 400
        xx2 = 400
        yy2 = 400
        ofs = 40

        setProperty('black.alpha',1)
        setProperty('lightExe.alpha',1)
        doTweenAlpha('blackfade5', 'black', 0, 2.5, 'linear');
    end

    if curStep == 3312 then
        removeLuaSprite('lightExe')
        setProperty('boyfriend.alpha',1)
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
        addLordXStage();
    end

    if curStep == 3696 then
        removeLuaSprite('sunkyBG')
        removeLuaSprite('sunky')
        removeLuaSprite('tailsdoll1')
        removeLuaSprite('majin')
        removeLuaSprite('downHead')
        removeLuaSprite('rocksMajin')
        removeLuaSprite('tormentBG')
        removeLuaSprite('splitDad')
        removeLuaSprite('splitBF')

        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
        addReroyStage()

        ofs = 150
    end

    if curStep == 3791 then
        removeReroyStage()
        showTooSlowStage()
        cameraFlash('camHUD', '0xFFFFFFFF', 0.5)
    end

    if curStep == 3978 then
    playSound('week_5',0.5)
    setProperty('black.alpha',1)
    setObjectCamera('jumpscare1', 'hud');
    addLuaSprite('jumpscare1', true);
    doTweenAlpha('jumpscareFade', 'jumpscare1', 0, 2, 'linear');
    end
end

function followChar()
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
        
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

function followCharPov()

    if curStep < 960 or curStep > 1008 then

    if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
        triggerEvent('Camera Follow Pos',xx3-ofs2,yy3)
    end
    if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
        triggerEvent('Camera Follow Pos',xx3+ofs2,yy3)
    end
    if getProperty('dad.animation.curAnim.name') == 'singUP' then
        triggerEvent('Camera Follow Pos',xx3,yy3-ofs2)
    end
    if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
        triggerEvent('Camera Follow Pos',xx3,yy3+ofs2)
    end
    if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
        triggerEvent('Camera Follow Pos',xx3-ofs2,yy3)
    end
    if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
        triggerEvent('Camera Follow Pos',xx3+ofs2,yy3)
    end
    if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
        triggerEvent('Camera Follow Pos',xx3,yy3-ofs2)
    end
    if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
        triggerEvent('Camera Follow Pos',xx3,yy3+ofs2)
    end
    if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
        triggerEvent('Camera Follow Pos',xx3,yy3)
    end
    if getProperty('dad.animation.curAnim.name') == 'idle' then
        triggerEvent('Camera Follow Pos',xx3,yy3)
    end
    end
end

function followPiracy()

    if getProperty('dad.animation.curAnim.name') == 'idle' then
        setProperty('piracybf.x',xPos)
        setProperty('piracybf.y',yPos)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if curStep >= 2447 and curStep <= 2495 then
        if direction == 0 then --LEFT

            setProperty('piracybf.x',xPos - 70 )
            setProperty('piracybf.y',yPos + 20)

        elseif direction == 1 then -- DOWN

            setProperty('piracybf.x',xPos)
            setProperty('piracybf.y',yPos + 10)

        elseif direction == 2 then --UP

            setProperty('piracybf.x',xPos)
            setProperty('piracybf.y',yPos - 10)

        elseif direction == 3 then --RIGHT

            setProperty('piracybf.x',xPos + 70)
            setProperty('piracybf.y',yPos)

        end
    end
end