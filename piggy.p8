pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
//main

function _init()
	t,fc,fp,s=0,1,1,4 --tick,frame,step
	expandmap = 0
 make_player()
 make_hammer()
end

function _update()
	t=(t+1)%s --tick fwd
	expandmap=(expandmap+1)%90
 if (t==0)then
  fc=fc%#cs+1
  fp=fp%#fs+1
  
 end
 
 if(expandmap == 0) then
  newcoin = make_coin(player.x)
		add(coins,newcoin)
		if(#coins > 10) then
			del(coins,coins[0])
		end
		
		smash_hammer()
		put_items()
		put_obs()
 end
 
 move_player()
 move_coins()
 move_hammer()
 move_items()
 move_obs()
 
 if game_over and btn(5) then
  game_start()
 end
end

function _draw()
 cls()

 camera(player.x - 30,0)

 draw_grounds()
 map(0, 0, -bg, 0, 128, 32)
 
 draw_obs()
 draw_items()
 draw_hammer()
 draw_player()
 draw_coins()
 
 --draw score
 print("coins: "..player.ncoin, player.x - 30, 110)
 
 --draw lives
 print("lives: "..player.lives, player.x - 30, 120)
end

function game_start()
 curr_speed = 1
 player.lives = 2
 game_over=false
end

function game_end()
 player.stuck = true
	bg=0
	curr_speed=0
 player.lives = 0
 game_over=true
end
-->8
//player

fs={80,84} --happy pig
fhs={88,92} --damaged pig
fds=28 --dead pig
can_animate = true

function make_player()
	player = {}
	player.x = 30
	player.y = 30
	player.dy = 0
	player.lives = 2
	player.ncoin = 0
	player.sprite = 80
	player.jump_height = 0
	player.jump_alowed = true
	player.on_ground = false
	player.stuck = false
end

function animate_player()
		if player.lives == 2 then
		 if can_animate then
		  player.sprite=fs[fp]
		 end
		elseif player.lives == 1 then
		 if can_animate then
			 player.sprite=fhs[fp]
			end
		else player.sprite=fds
		end
end

function move_player()

 animate_player()

	player.dy = gravity*2
	
	--ground colision
 if hit(player.x,player.y+player.dy,32,22) == 8 then
  player.on_ground=true
  player.dy=0
 else
  player.on_ground=false      
 end
	
	--jump
 if (btn(2)) then
  if player.jump_alowed and player.jump_height < 10 then
   player.dy-=3
		 player.stuck = false;
   player.jump_height+=1
  elseif player.on_ground then
   player.jump_alowed = true
   player.jump_height = 0
   player.dy=0
  end
 end
 
 --move player right
 if btn(1) and not(player.stuck) then
   curr_speed=1.5 --right
   can_animate = true

 --move player left
 elseif btn(0) and not(player.stuck) then
   curr_speed=0.5 --left
   can_animate = false

 elseif not(player.stuck) then
   curr_speed=1
   can_animate = true
 end
 
 --move to new position
 player.y+=player.dy
end

function player_hit()
 if player.lives == 2 then
  player.lives-=1
 elseif player.lives == 1 then
  game_end()
 end
end

function draw_player()
	spr(player.sprite,player.x,player.y,4,3)
end
-->8
//coin

coins = {}
--coin sprite
cs={12,13,14,15,14,13}
	

function move_coins()
 for c in all(coins) do
 	move_coin(c)
 	check_collision(c)
 	animate_coin(c)
 end
end

function draw_coins()
 for c in all(coins) do
 	draw_coin(c)
 end 
end

function make_coin(pos)
	local coin = {}
	coin.x = rnd(100)+100
	coin.y = rnd(20)
	coin.dy = 1
	coin.value = 0
	coin.sprite = min(pos+1,6)
	coin.id = pos
	return coin
end

function animate_coin(coin)
 coin.sprite=cs[fc]
end

function move_coin(coin)
	coin.x -= curr_speed
	coin.dy = gravity
	
		--ground colision
 if hit(coin.x,coin.y+coin.dy,4,4) == 8 then
  on_ground=true
  coin.dy=0
  else
  on_ground=false      
 end
 
 coin.y += coin.dy
 	
end

function check_collision(coin)

	if(coin.x >=player.x-5 and coin.x <=player.x+24) 
	then
		if(coin.y >= player.y and coin.y <=player.y+32) 
		then
		colect_coin(coin)
		end
	end
	
end

function colect_coin(coin)
	del(coins, coin)
	player.ncoin+=1
end

function draw_coin(coin)
 spr(coin.sprite,coin.x,coin.y)
end


-->8
//hammer

degrees = 0
fliprot = false

function make_hammer()
	hammer = {}
	hammer.x = 0
	hammer.y = 50
	hammer.sprite = 8
end

function draw_hammer()
	spr(hammer.sprite,hammer.x,hammer.y,4,4, false, fliprot)
end

function move_hammer()
	hammer.x = -curr_speed*10+10
end

function smash_hammer()
	if game_over then return end
	fliprot = not(fliprot)
	if curr_speed == 0.5 and fliprot then
	 player_hit()
	end
end
-->8
//global

gravity=0.5
game_over=false

function hit(x,y,w,h)
  collide=0
  for i=x,x+w,w do
    if (fget(mget(i/8,y/8))>0)
     then collide=fget(mget(i/8,y/8))
    elseif (fget(mget(i/8,(y+h)/8))>0)
     then collide=fget(mget(i/8,(y+h)/8))
    end
  end
  
  for i=y,y+h,h do
    if (fget(mget(x/8,i/8))>0)
     then collide=fget(mget(x/8,i/8))
    elseif (fget(mget((x+w)/8,i/8))>0) 
     then collide=fget(mget((x+w)/8,i/8))
    end
  end
  
  return collide
end
-->8
//map

bg=0
curr_speed =1

function draw_grounds()
 bg = (bg+curr_speed)%64
end
-->8
//background

items = {}
bigitemlocs = {1,5,33,35,37}
curindex = 1

function put_items()
	item = put_item(bigitemlocs[curindex])
	add(items,item)
	curindex += 1
	if curindex == #bigitemlocs then
		curindex = 1
	end
end

function move_items()
 for i in all(items) do
 	move_item(i)
 end
end

function draw_items()
 for i in all(items) do
 	draw_item(i)
 end
end

function put_item(index)
	local item = {}
	item.x = 150
	item.y = max(rnd(60),20)
	item.sprite = index
	return item
end

function draw_item(item)
 spr(item.sprite,item.x,item.y,2,2)
end

function move_item(item)
 item.x -= curr_speed/2
end
-->8
//obstacles

obstacles = {}
obstacleslocs = {16,32,48,39,55}
cur = 1

function put_obs()
	ob = put_ob(obstacleslocs[cur])
	add(obstacles,ob)
	cur += 1
	if cur == #obstacleslocs then
		cur = 1
	end
end

function move_obs()
 for i in all(obstacles) do
  	if(i.x == player.x+28 and player.y == 41) 
		 then
		  player.stuck = true
		  bg=0
		  curr_speed=0
		 else
	 end
 	move_ob(i)
 end
end

function draw_obs()
 for i in all(obstacles) do
 	draw_ob(i)
 end
end

function put_ob(index)
	local ob = {}
	ob.x = 150
	ob.y = 84
	ob.sprite = index
	return ob
end

function draw_ob(item)
 spr(item.sprite,item.x,item.y,1,1)
end

function move_ob(ob)
	ob.x -= curr_speed
end


__gfx__
00000000444444444444444444444444444444440000070700000000ffffffff00000000000000000000000000000000009aa700009aa7000009700000097000
00000000455555555555555445555999b583355400000c7c00000000ffffffff0000000000000070000000000000000009aaaa7009aaaa70009aa70000097000
0070070045555558555555544f5bb999b1833cc4000055855006000044444444000000000000006700000000000000009aa97aa709a97aa000997a000009a000
00077000455555558b5555544fdbb999b1833cc4000007770060600044444444000000000000066670000000000000009a9aa7a709a97aa000999a000009a000
00077000455555553b5b55544fdbb999b1833cc4000007770600000044444444000000000000666670000000000000009a9aa9aa09a99aa000999a000009a000
007007004555555333b555544fdbb999b1833cc4000007770060000044444444000000000005666665056700000000009aa99aaa09a99aa000999a000009a000
0000000045555555aaa555544fdbb999b1833cc40000077706000000444444440000000005565666565666700000000009aaaaa009aaaaa0009aaa000009a000
0000000045555555595555544fdbb999b1833cc40000677760000000444444440000000000556566666666670000000000999900009999000009900000099000
cccccc004444444444444444444444444444444400006767600000004b4bb4b40000000000055556666666667000000000000000000000000000000000000000
01111110455555555555555445555555555555540006776776000000b433334b0000000000000556666666676700000000000000000000000000000000000000
03333333455555555555555445cc7555555555549999999999999999433333340000000000000065666666667670000000000000000000000000000000000000
00fffff0455eeee555cc755445575555555aa5549999999999999999b333333b0000000000000056566666666660000000000000000000000000000000000000
033333334555111155c7cc5445cc75555588a5544994444444444994333333330000000000000055656666666550000000000000000000000000000e00000000
888888884558888555ccc55445ccc55552222254099400000000499043333334000000000000055656566666666570000000000000eeeeeeeeee00eee0000000
0ffffff0444444444444444445ccc5555522255409900000000009905433334500000000000005555565666666656700000000000eee2222222ee0e88e000000
88888888444444444444444444444444444444440000000000000000454554540000000000009955565656666666667000000000eee222222222eeeeeee00000
000707005dddddddddddddd544444444444444440000000000000000000bb0800000000000099a9555556566666666600000000eee2eeee2eeee2eeeeeee0000
00707000d55555555555555d4cccccccccccccc400000000000000000303b800000000000099aaa95556565666666660000000eeeeeeee2e2eeeeeee1e1ef000
00000000d51111111111115d4cc7ccccccccccc400000000000000000303bb0b00000000099aaaaa900555656666650000000eeeeee8eeeee2eeeeeee1eeff00
01cccc00d5111171111a915d4c777cccccccccc4007000000000000000333bb00000000099aaaaa990005556666550000000e0eeee8eeeeeeee2eeee1e1efff0
01ccccc0d51711111119915d4cccccccccccccc400070000000000000aaaaaa0000000099aaaaa990000005565550000000e00e2eeeeeeee2e2eeeeeeeeef5f0
01cccc0cd51111111111115d4444444444444444009000000000000009aaaaa000000099aaaaa9900000000555500000000e008e2e2eeeeee2e2eeeeeeeefff0
001cc0c0d51111311711115d4cccccccccccccc40900099900709000009aaa000000099aaaaa99000000000555000000000e008ee2eeeeee2eeeeeeee2e89ff0
00111000d51113331111115d4cccccccccccccc40090999990b9b00000099000000099aaaaa9900000000000000000000000e0882e2eeee2e2eeeeee2e889880
aaaaaaaad51b333bb111115d4ccccccccc777cc400099944999890000000700000099aaaaa99000000000000000000000000e00888e2ee2eee2eeeeee2889980
0bbbbbb0d5bbb3bbbb11135d4cccccccc67777c40000999949999990000b00000099aaaaa9900000000000000000000000000e00888eeeeeeee2eeee28880088
99999990d5babbbbbbbb335d4ccccccccc667cc4dddddddddddddddd0b00b0b0099aaaaa9900000000000000000000000000e00008e8eeeeeeeeeee8e8800000
0fffff00d5bbbbbbebbbbb5d4cccccccccccccc4ddddddddddddddddb0b00b0799aaaaa990000000000000000000000000000000888e8eeeeeeeee8e88800000
99999990d5bbbabbbbbbab5d4cc7ccccccccccc45dd5555555555dd5000b0b0099aaaa99000000000000000000000000000000d88888e8eeeeeee8e8888ee600
ddddddddd5bbbbbbbbbbbb5d4ccc7cccccccccc40dd5000000005dd004999990099aa990000000000000000000000000000000d888888888eee8888888888d00
0ffffff0d55555555555555d4cccccccccccccc40dd0000000000dd00499999000999900000000000000000000000000000000d8888222888888822288888d00
dddddddd5dddddddddddddd5444444444444444400000000000000000044990000099000000000000000000000000000000000d8882200088888000228888d00
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000e000000000000000000000000000000e00000000000000000000000000000000e000000000000000000000000000000e00000000
0000000000eeeeeeeeee000e8e0000000000000000eeeeeeeeee00e8e00000000000000000eeeeeeeeee000e8e0000000000000000eeeeeeeeee00e8e0000000
000000000eee2222222ee0ee88000000000e00000eee2222222ee0e88e000000000000000eee2222222ee0ee88000000000e00000eee2222222ee0e88e000000
00000000eee222222222eeeeeee0000000e0e000eee222222222eeeeeee0000000000000eee222222222eeeeeee0000000e0e000eee222222222eeeeeee00000
000e000eee2eeeeeeeee2eeee7ee000000e0e00eee2eeeeeeeee2eeee7ee0000000e000eee2eeeeeeeee2eeeeeee000000e0e00eee2eeeeeeeee2eeeeeee0000
00e0e0eeeeeeeeeeeeeeeeee771ef000e00e00eeeeeeeeeeeeeeeeee771ef00000e0e0eeeeeeeeeeeeeeeeeeeeeef000e00e00eeeeeeeeeeeeeeeeeeeeeef000
e00e0eeeeee8eeeeeeeeeeee771efff00ee0eeeeeee8eeeeeeeeeeee771eff00e00e0eeeeee8eeeeeeeeeeee771efff00ee0eeeeeee8eeeeeeeeeeee771eff00
0ee0eeeeee8eeeeeeeeeeeee777ef5f0000000eeee8eeeeeeeeeeeee777efff00ee0eeeeee8eeeeeeee2eeee771ef5f0000000eeee8eeeeeeee2eeee771efff0
000000eeeeeeeeeeeeeeeeee777ef5f0000000eeeeeeeeeeeeeeeeee777ef5f0000000eeeeeeeeee2e2eeeeefffef5f0000000eeeeeeeeee2e2eeeeefffef5f0
0000008eeeeeeeeeeeeeeeeee7eef5f00000008eeeeeeeeeeeeeeeeee7eef5f00000008eeeeeeeeee2e2eeeeeeeef5f00000008eeeeeeeeee2e2eeeeeeeef5f0
0000008eeeeeeeeeeeeeeeeeeee89ff00000008eeeeeeeeeeeeeeeeeeee89ff00000008eeeeeeeee2eeeeeeeeee89ff00000008eeeeeeeee2eeeeeeeeee89ff0
000000888eeeeeeeeeeeeeeeee889990000000888eeeeeeeeeeeeeeeee889990000000888eeeeee2e2eeeeeeee889990000000888eeeeee2e2eeeeeeee889990
0000000888eeeeeeeeeeeeeee88890000000000888eeeeeeeeeeeeeee88890000000000888eeeeeeee2eeeeee88890000000000888eeeeeeee2eeeeee8889000
00000000888eeeeeeeeeeeee8888000000000000888eeeeeeeeeeeee8888000000000000888eeeeeeeeeeeee8888000000000000888eeeeeeeeeeeee88880000
000000000888eeeeeeeee88888800000000000000888eeeeeeeee88888800000000000000888eeeeeeeee88888800000000000000888eeeeeeeee88888800000
00000000008888888888888e8800000000000000008888888888888e8800000000000000008888888888888e8800000000000000008888888888888e88000000
0000000000088888888888e2200000000000000000088888888888e2200000000000000000088888888888e2200000000000000000088888888888e220000000
00000000000888e2200888e22000000000000000000888e2200888e22000000000000000000888e2200888e22000000000000000000888e2200888e220000000
00000000000888e1100888e1100000000000000000055562200555622000000000000000000888e1100888e11000000000000000000555622005556220000000
00000000000555600005556000000000000000000000011110000111100000000000000000055560000555600000000000000000000001111000011110000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000008880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000008e80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000008888880008880008888880008888880008888800000008888880008800088000888880000000888888000888880008888880008888888000000
0000000000008eeeeee808eee808eeeeee808eeeeee808ef8ff8000008eeeffe808ef808ff808eeeff8000008eeeeff808eeeee808eef8ef808eef8eff800000
0000000000008eeeffe808efe808eeeffe808eeeffe808ee8ef8000008eeeefe808ee808ef808eeeef8000008eeeeef808eeffe808eee8ef808eee8eef800000
0000000000008eeeefe808eef808eeeefe808eeeefe808eeeee8000008eeeeee808ee888ee808ee8888000008eee8ee808eeefe808eeeeee808eeeeeee800000
0000000000008ee8eee808eee808eeeeee808eeeeee808eeeee800000088ee88008eeeeeee808eeeee8000008eeeeee808ee8ee808eeeeee808eeeeeee800000
0000000008008eeeeee808eee808eee888008eee8880008eee8000000008ee80008eeeeeee808eeeee8000008eeeee8008eeeee808eeeeee808eeeee88800000
0000000080808eeee88008eee808eee8ee808eee8ee8008eee8000000008ee80008eeeeeee808eeeee8000008eeeee8008eeeee808eeeeee808eeeeeee800000
0000000080808eee800008eee808eeee8e808eeee8e8008eee8000000008ee80008ee888ee808ee8888000008eeeeee808eeeee808eeeeee808eeeeeee800000
0000008008008eee800008eee808eeeeee808eeeeee8008eee8000000008ee80008ee808ee808eeeee8000008eee8ee808eeeee808eeeeee808eeeeeee800000
0000000880888eee800008eee808eeeeee808eeeeee8008eee8000000008ee80008ee808ee808eeeee8000008eeeeee808ee8ee808ee8eee808eee8eee800000
0000000000008eee800008eee808eeeeee808eeeeee8008eee8000000008ee80008ee808ee808eeeee8000008eeeeee808ee8ee808ee8eee808eee8eee800000
00000000000008880000008880008888880008888880000888000000000088000008800088000888880000000888888000888880008888880008888888000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88800000000008880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8ef8000000008ef80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8ee8888888888ee80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88eeeeeeeeeeee880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008eeeeeeeeee8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008eeeeeeeeee8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001c77eeeecc77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001c77eeeecc77000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001ccceeeeccc1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001cccffffccc1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008eee5ff5eee8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000888ffff8880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000008ee80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00008eeeeee800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00008ee88ee800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000550055000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0001010000000008010100000404040410010100000000000000000000000000100000010100001000000000000000001000000101000010000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000010100000000000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000040404040404080000000000000000010101010000000000000000000000000101010100000000000000000000000001010000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
