
function onCreate()
precacheImage('jumpscare/simplejump')
end

function onEvent(name, value1, value2)
	if name == "sonicEXE" then
         makeLuaSprite('image', 'jumpscare/simplejump', -150, -50);
		scaleObject('image', 0.8, 0.8)
        addLuaSprite('image', true);
        setObjectCamera('image', 'other');
		setObjectOrder('image', 1)
		runTimer('chauP', 0.4);
		playSound('sppok',1)
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'chauP' then
		doTweenAlpha('adiosJumpscare', 'image', 0, 0.1, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'adiosJumpscare' then
		removeLuaSprite('image', true);
		cameraShake('other', 0,0)
	end
end