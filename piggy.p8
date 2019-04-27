pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
//main

function _init()
	t,fc,fp,s=0,1,1,4 --tick,frame,step
	expandmap = 0
	cs={1,2,3,4,5,6}
	fs={64,68}
 game_over=false
 make_player()
end

function _update()
	t=(t+1)%s --tick fwd
	expandmap=(expandmap+1)%80
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
 end
 
 move_player()
 move_coins()
 
 printh("bg "..bg)
end

function _draw()
 cls()

 camera(player.x - 30,0)

 draw_grounds()
 map(0, 0, -bg, 0, 128, 32)
 
 draw_player()
 draw_coins()
 
 --draw score
 print("coins: "..player.ncoin, player.x - 30, 10)
end
-->8
//player
can_animate = true

function make_player()
	player = {}
	player.x = 30
	player.y = 30
	player.dy = 0
	player.lives = 0
	player.ncoin = 0
	player.sprite = 64
end

function animate_player()
	if can_animate then
		player.sprite=fs[fp]
	end
end

function move_player()

 on_ground=false
	player.dy = gravity
	
	--ground colision
 if hit(player.x,player.y+player.dy,30,30) == 8 then
  on_ground=true
  player.dy=0
 else
  on_ground=false      
 end
	
	--jump
 if (btnp(2)) then
  if (on_ground) then
   player.dy-=20
  end
 end
 
 --move player right
 if btn(1) then
   curr_speed=1.5 --right
   can_animate = true

 --move player left
 elseif btn(0) then
   curr_speed=0.5 --left
   can_animate = false

 else
   curr_speed=1
   can_animate = true
 end
 
 --move to new position
 player.y+=player.dy
 --player.x+=1
 animate_player()
end

function draw_player()
	spr(player.sprite,player.x,player.y,4,4)
end
-->8
//coin

coins = {}

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

	if(coin.x >=player.x and coin.x+6 <=player.x+30) 
	then
		if(coin.y >= player.y and coin.y+6 <=player.y+30) 
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
__gfx__
00000000444444444444444400000000000000000000070700000000ffffffff00000000000000000000000000000000009aa700009aa7000009700000097000
000000004555555555555554000000000000000000000c7c00000000ffffffff0000000000000070000000000000000009aaaa7009aaaa70009aa70000097000
0070070045555558555555540000000000000000000055855006000044444444000000000000006700000000000000009aa97aa709a97aa000997a000009a000
00077000455555558b5555540000000000000000000007770060600044444444000000000000066670000000000000009a9aa7a709a97aa000999a000009a000
00077000455555553b5b55540000000000000000000007770600000044444444000000000000666670000000000000009a9aa9aa09a99aa000999a000009a000
007007004555555333b555540000000000000000000007770060000044444444000000000005666665056700000000009aa99aaa09a99aa000999a000009a000
0000000045555555aaa5555400000000000000000000077706000000444444440000000005565666565666700000000009aaaaa009aaaaa0009aaa000009a000
00000000455555555955555400000000000000000000677760000000444444440000000000556566666666670000000000999900009999000009900000099000
cccccc004444444444444444000000000000000000006767600000004b4bb4b40000000000055556666666667000000000000000000000000000000000000000
01111110455555555555555400000000000000000006776776000000b433334b0000000000005556666666676700000000000000000000000000000000000000
03333333455555555555555400000000000000009999999999999999433333340000000000000565666666667670000000000000000000000000000000000000
00fffff0455eeee555cc755400000000000000009999999999999999b333333b0000000000000556566666666660000000000000000000000000000000000000
033333334555111155c7cc5400000000000000004994444444444994333333330000000000000555656666666550000000000000000000000000000e00000000
888888884558888555ccc5540000000000000000099400000000499043333334000000000000555656566666666570000000000000eeeeeeeeee00eee0000000
0ffffff04444444444444444000000000000000009900000000009905433334500000000000095555565666666656700000000000eee2222222ee0e88e000000
88888888444444444444444400000000000000000000000000000000454554540000000000009955565656666666667000000000eee222222222eeeeeee00000
000707005dddddddddddddd544444444444444440000000000000000000bb0800000000000099a9555556566666666600000000eee2eeee2eeee2eeeeeee0000
00707000d55555555555555d4cccccccccccccc400000000000000000303b800000000000099aaa95556565666666660000000eeeeeeee2e2eeeeeee1e1ef000
00000000d51111111111115d4cc7ccccccccccc400000000000000000303bb0b00000000099aaaaa995555656666650000000eeeeee8eeeee2eeeeeee1eeff00
01cccc00d5111171111a915d4c777cccccccccc4007000000000000000333bb00000000099aaaaa990005556566550000000e0eeee8eeeeeeee2eeee1e1efff0
01ccccc0d51711111119915d4cccccccccccccc400070000000000000aaaaaa0000000099aaaaa990000005565550000000e00e2eeeeeeee2e2eeeeeeeeef5f0
01cccc0cd51111111111115d4444444444444444009000000000000009aaaaa000000099aaaaa9900000000555500000000e008e2e2eeeeee2e2eeeeeeeefff0
001cc0c0d51111311711115d4cccccccccccccc40900099900709000009aaa000000099aaaaa99000000000555000000000e008ee2eeeeee2eeeeeeee2e89ff0
00111000d51113331111115d4cccccccccccccc40090999990b9b00000099000000099aaaaa9900000000000000000000000e0882e2eeee2e2eeeeee2e889880
aaaaaaaad51b333bb111115d4ccccccccc777cc400099944999890000000700000099aaaaa99000000000000000000000000e00888e2ee2eee2eeeeee2889980
0bbbbbb0d5bbb3bbbb11135d4cccccccc67777c40000999949999990000b00000099aaaaa9900000000000000000000000000e00888eeeeeeee2eeee28880088
99999990d5babbbbbbbb335d4ccccccccc667cc4dddddddddddddddd0b00b0b0099aaaaa9900000000000000000000000000e0000888eeeeeeeee88888800000
0fffff00d5bbbbbbebbbbb5d4cccccccccccccc4ddddddddddddddddb0b00b0799aaaaa990000000000000000000000000000000888888eeeeee888888800000
99999990d5bbbabbbbbbab5d4cc7ccccccccccc45dd5555555555dd5000b0b0099aaaa99000000000000000000000000000000d88888888eeee88888888ee600
ddddddddd5bbbbbbbbbbbb5d4ccc7cccccccccc40dd5000000005dd004999990099aa990000000000000000000000000000000d8888888888888888888888d00
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
000e000eee2eeeeeeeee2eeee7ee0000000e000eee2eeeeeeeee2eeee7ee0000000e000eee2eeeeeeeee2eeeeeee0000000e000eee2eeeeeeeee2eeeeeee0000
00e0e0eeeeeeeeeeeeeeeeee771ef00000e0e0eeeeeeeeeeeeeeeeee771ef00000e0e0eeeeeeeeeeeeeeeeeeeeeef00000e0e0eeeeeeeeeeeeeeeeeeeeeef000
000e00eeeee8eeeeeeeeeeee771efff00e000eeeeee8eeeeeeeeeeee771eff00000e00eeeee8eeeeeeeeeeee771efff00e000eeeeee8eeeeeeeeeeee771eff00
00e0e0eeee8eeeeeeeeeeeee777ef5f0000000eeee8eeeeeeeeeeeee777efff000e0e0eeee8eeeeeeee2eeee777ef5f0000000eeee8eeeeeeee2eeee777efff0
0e000eeeeeeeeeeeeeeeeeee777ef5f0000000eeeeeeeeeeeeeeeeee777ef5f00e000eeeeeeeeeee2e2eeeee777ef5f0000000eeeeeeeeee2e2eeeee777ef5f0
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
0000000000008eeeeee808eee808eeeeee808eeeeee808ee8ee8000008eeeeee808ee808ee808eeeee8000008eeeeee808eeeee808eee8ee808eee8eee800000
0000000000008eeeeee808eee808eeeeee808eeeeee808ee8ee8000008eeeeee808ee808ee808eeeee8000008eeeeee808eeeee808eee8ee808eee8eee800000
0000000000008eeeeee808eee808eeeeee808eeeeee808eeeee8000008eeeeee808ee888ee808ee8888000008eee8ee808eeeee808eeeeee808eeeeeee800000
0000000000008ee8eee808eee808eeeeee808eeeeee808eeeee800000088ee88008eeeeeee808eeeee8000008eeeeee808ee8ee808eeeeee808eeeeeee800000
0000000008008eeeeee808eee808eee888008eee8880008eee8000000008ee80008eeeeeee808eeeee8000008eeeee8008eeeee808eeeeee808eeeee88800000
0000000080808eeee88008eee808eee8ee808eee8ee8008eee8000000008ee80008eeeeeee808eeeee8000008eeeee8008eeeee808eeeeee808eeeeeee800000
0000000008008eee800008eee808eeee8e808eeee8e8008eee8000000008ee80008ee888ee808ee8888000008eeeeee808eeeee808eeeeee808eeeeeee800000
0000000080808eee800008eee808eeeeee808eeeeee8008eee8000000008ee80008ee808ee808eeeee8000008eee8ee808eeeee808eeeeee808eeeeeee800000
0000008800088eee800008eee808eeeeee808eeeeee8008eee8000000008ee80008ee808ee808eeeee8000008eeeeee808ee8ee808ee8eee808eee8eee800000
0000000000008eee800008eee808eeeeee808eeeeee8008eee8000000008ee80008ee808ee808eeeee8000008eeeeee808ee8ee808ee8eee808eee8eee800000
00000000000008880000008880008888880008888880000888000000000088000008800088000888880000000888888000888880008888880008888888000000
__gff__
0001010000000008010100000404040401010100000000000000000000000000000000010100000000000000000000000100000101000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000010100000000000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000040404080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070707070700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
