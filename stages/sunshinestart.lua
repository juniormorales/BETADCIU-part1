function onCreate()

   	makeAnimatedLuaSprite('sunshinebg','background/sunshine/sunshinebg', 45, 160)
    	addAnimationByPrefix('sunshinebg','sunshinebg','lastchancetailsbg3 1 loop',12,false);
    	objectPlayAnimation('sunshinebg','lastchancetailsbg3 1 loop',false);
	setProperty('sunshinebg.antialiasing', false)
	scaleObject('sunshinebg', 1, 1)

	addLuaSprite('sunshinebg', false);

	function onBeatHit(beat)
		if (curBeat % 2 == 0) then
		objectPlayAnimation('sunshinebg','cryingbopp',true)
		end
	end

	makeAnimatedLuaSprite('sunshinestart','background/sunshine/sunshinestart', 45, 245)
    	addAnimationByPrefix('sunshinestart','sunshinestart','lastchancetailsbg3 2 loop',12,true);
    	objectPlayAnimation('sunshinestart','lastchancetailsbg3 2 loop',false);
	setProperty('sunshinestart.antialiasing', false)
	setProperty('sunshinestart.visible', true)
	scaleObject('sunshinestart', 1, 1)

	addLuaSprite('sunshinestart', false);

	function onBeatHit(beat)
		if (curBeat % 2 == 0) then
		objectPlayAnimation('sunshinestart','emptyspring',true)
		end
	end



	close(true);
end

function onCreatePost()--this thing happens once the characters are spawned

end
