local xx3 = 1300;
local yy3 = 350;
local ofs2 = 150;

-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'199', '-20'}
downoffsets = {'-44', '-32'}
upoffsets = {'-37', '221'}
rightoffsets = {'-40', '-25'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'piracy_head'
doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/piracyhead', 2100, 50);

	addAnimationByPrefix(name_of_character, 'idle', 'idle', 24, true);
	addAnimationByPrefix(name_of_character, 'singLEFT', 'left', 24, true);
	addAnimationByPrefix(name_of_character, 'singDOWN', 'down', 24, true);
	addAnimationByPrefix(name_of_character, 'singUP', 'up', 24, true);
	addAnimationByPrefix(name_of_character, 'singRIGHT', 'right', 24, true);

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 1, 1);
	
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' or (curStep >= 1104 and curStep <= 1295) then
		doIdle = false
		objectPlayAnimation(name_of_character, singAnims[direction + 1], true);

		if direction == 0 then
			setProperty(name_of_character .. '.offset.x', leftoffsets[1]);
			setProperty(name_of_character .. '.offset.y', leftoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
			triggerEvent('Camera Follow Pos',xx3-ofs2,yy3)

		elseif direction == 1 then
			setProperty(name_of_character .. '.offset.x', downoffsets[1]);
			setProperty(name_of_character .. '.offset.y', downoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
			triggerEvent('Camera Follow Pos',xx3,yy3+ofs2)

		elseif direction == 2 then
			setProperty(name_of_character .. '.offset.x', upoffsets[1]);
			setProperty(name_of_character .. '.offset.y', upoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end
			triggerEvent('Camera Follow Pos',xx3,yy3-ofs2)

		elseif direction == 3 then
			setProperty(name_of_character .. '.offset.x', rightoffsets[1]);
			setProperty(name_of_character .. '.offset.y', rightoffsets[2]);

			if isSustainNote then
				objectPlayAnimation(name_of_character, singAnims[direction + 1], true);
			end

			triggerEvent('Camera Follow Pos',xx3+ofs2,yy3)

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