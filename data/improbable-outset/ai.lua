-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'-52', '2'}
downoffsets = {'69', '-32'}
upoffsets = {'71', '10'}
rightoffsets = {'74', '-44'}

-- change all of these to the name of the animation in your character's xml file
idle_xml_name = 'AINeutral0'
left_xml_name = 'AILeft0'
down_xml_name = 'AIDown0'
up_xml_name = 'AIUp0'
right_xml_name = 'AIRight0'


-- basically horizontal and vertical positions
x_position = -280
y_position = 550

-- scales your character (set to 1 by default)
xScale = 2.2
yScale = 2.2


-- pretty self-explanitory
name_of_character_xml = 'ai-hoshino'
name_of_character = 'ai'

-- if it's set to true the character appears behind the default characters, including gf, watch out for that

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/' .. name_of_character_xml, x_position, y_position);
	addAnimationByPrefix(name_of_character, 'idle', idle_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singLEFT', left_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', down_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', up_xml_name, 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', right_xml_name, 24, false);

	setProperty(name_of_character .. '.antialiasing', false);

	setPropertyLuaSprite(name_of_character, 'flipX', true);

	scaleObject(name_of_character, xScale, yScale);


	makeLuaSprite('aiBG', 'background/ai/hoshino-stage', -950, 50);

	makeAnimatedLuaSprite('pixel2', 'pixelthing', -1170, -100) -- -1725 x
	addAnimationByPrefix('pixel2', 'idle', 'pixelthing', 24, true)
	scaleObject('pixel2', 2.1, 2)
	
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' or (curStep >= 1023 and curStep <= 1087 ) then
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