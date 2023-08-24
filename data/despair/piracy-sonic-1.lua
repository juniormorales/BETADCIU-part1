-- script base by ItsCapp 
idleoffsets = {'0', '0'} -- I recommend you have your idle offset at 0
leftoffsets = {'60', '-6'}
downoffsets = {'0', '-20'}
upoffsets = {'-5', '40'}
rightoffsets = {'-38', '-4'}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
name_of_character = 'anti_piracy_1'
doIdle = true

function onCreate()
	makeAnimatedLuaSprite(name_of_character, 'characters/anti_piracy', 50, 185);

	addAnimationByIndices(name_of_character,'danceLeft','idle','30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14')
	addAnimationByIndices(name_of_character,'danceRight','idle','15,16,17,18,19,20,21,22,23,24,25,26,27,28,29')
	addAnimationByPrefix(name_of_character, 'singLEFT', 'left0', 24, false);
	addAnimationByPrefix(name_of_character, 'singDOWN', 'down0', 24, false);
	addAnimationByPrefix(name_of_character, 'singUP', 'up0', 24, false);
	addAnimationByPrefix(name_of_character, 'singRIGHT', 'right0', 24, false);

	setProperty(name_of_character..'.antialiasing', false);
	setPropertyLuaSprite(name_of_character, 'flipX', false);
	scaleObject(name_of_character, 0.4, 0.4);
	
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'No Animation' then
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
		objectPlayAnimation(name_of_character, 'danceRight');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end

	if curBeat % 2 ~= 0  and doIdle then
		objectPlayAnimation(name_of_character, 'danceLeft');
		setProperty(name_of_character .. '.offset.x', idleoffsets[1]);
		setProperty(name_of_character .. '.offset.y', idleoffsets[2]);
	end
	doIdle = true
end