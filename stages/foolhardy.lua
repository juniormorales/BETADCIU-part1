function onCreate()

	makeLuaSprite("BG","background/foolhardy/zardybg",-1050, -590)
	scaleObject('BG',1.2,1.2)
	--addLuaSprite('BG', false)

	makeLuaSprite("clouds","background/foolhardy/zardyclouds",-300, -590)
	scaleObject('clouds',1.2,1.2)
	--addLuaSprite('clouds', false)

	makeLuaSprite("far","background/foolhardy/zardyfar1",-1300, -500)
	scaleObject('far',1.2,1.2)
	--addLuaSprite('far', false)

	makeLuaSprite("ground","background/foolhardy/zardyground",-1050, -450)
	scaleObject('ground',1.1,1.1)
	--addLuaSprite('ground', false)

	makeAnimatedLuaSprite('lila', 'background/foolhardy/SHES_SO_FINE_BRO', 350, 0)
	setProperty('lila.antialiasing', true)
	addAnimationByPrefix('lila', 'anim1', 'LILA idle', 24, true)
	--addLuaSprite('lila',false)
	--playAnim('lila', 'anim1', true)

	makeLuaSprite("overlay","background/foolhardy/zardyeffectoverlay",-900, -200)
	addLuaSprite('overlay', true)
end