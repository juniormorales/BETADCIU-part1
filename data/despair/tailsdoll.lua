noAnimated= true

-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'0', '0'}
downoffsets = {'0', '0'}
upoffsets = {'0', '0'}
rightoffsets = {'0', '0'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'Idle'
left_xml_name = 'Cleft'
down_xml_name = 'Cdown'
up_xml_name = 'Cup'
right_xml_name = 'Cright'


-- basically horizontal and vertical positions
x_position = 200
y_position = 1500

-- scales your character (set to 1 by default)
xScale = 3.215
yScale = 3.215

-- invisible character (so basically if you wanna use the change character event, you need to make the second character invisible first)
invisible = true

-- pretty self-explanitory
name_of_character_xml = 'TailsDoll3D'
name_of_character = 'tailsdoll1'

-- if it's set to true the character appears behind the default characters, including gf, watch out for that
playablecharacter = false -- change to 'true' if you want to flipX

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);
	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, false);

	addAnimationByPrefix(name_of_character, 'danceLeft', 'CdanceLeft', 24, false);
	addAnimationByPrefix(name_of_character, 'danceRight', 'CdanceRight', 24, false);

	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'transition2','Transition2',24,false);

	setProperty(name_of_character .. '.antialiasing', false);

	if playablecharacter == true then
		setPropertyLuaSprite(name_of_character, 'flipX', true);
	else
		setPropertyLuaSprite(name_of_character, 'flipX', false);
	end

	scaleObject(name_of_character, xScale, yScale);
	
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if curStep >= 3408 and curStep <= 3695 then
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
	if curStep >= 3376 and curStep <= 3407  and noAnimated then
		objectPlayAnimation(name_of_character, 'idle');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end

	if curStep >= 3408 and curStep <= 3695 then
		if curBeat % 2 == 0  and doIdle then
			objectPlayAnimation(name_of_character, 'danceLeft');
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end

		if curBeat % 2 ~= 0  and doIdle then
			objectPlayAnimation(name_of_character, 'danceRight');
			setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
			setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
		end
	end
	doIdle = true
end

function onTweenCompleted(tag)
	if tag == 'tweenYTails' then
		noAnimated = false
		playAnim('tailsdoll1','transition2',true)
	end
end

function onUpdate(elapsed)
	if curStep == 3376 then
		addLuaSprite('tailsdoll1',true)
		doTweenY('tweenYTails','tailsdoll1',getProperty('tailsdoll1.y')-850,1,'quadOut')
	end
end