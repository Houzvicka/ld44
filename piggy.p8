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
 
end

function _draw()
 cls()
 map(0, 0, 0, 0, 128, 32)
 camera(player.x,0)
 draw_player()
 draw_coins()
 
 --draw score
 print("coins: "..player.ncoin, player.x, 0)
end
-->8
//player
can_animate = true

function make_player()
	player = {}
	player.x = 10
	player.y = 10
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
	player.dy = gravity*2
	
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
   player.dy-=11
  end
 end
 
 --move player right
 if btn(1) then
   player.x+=1 --right
 end
 
 --move player left
 if btn(0) then
   player.x-=1 --left
   can_animate = false
 end
 
 --move to new position
 player.y+=player.dy
 player.x+=1
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
	coin.x = pos + 100
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
	coin.dy = gravity
	
		--ground colision
 if hit(coin.x,coin.y+coin.dy,14,14) == 8 then
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

gravity=1
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
__gfx__
00000000009aa700009aa700000970000009700000097000009aa7004b4bb4b40000000000000000000000000000000000000000000000000000000000000000
0000000009aaaa7009aaaa70009aa70000097000009aa70009aaaa70b433334b0000000000000070000000000000000000000000000000000000000000000000
007007009aa97aa709a97aa000997a000009a00000997a0009a97aa0433333340000000000000067000000000000000000000000000000000000000000000000
000770009a9aa7a709a97aa000999a000009a00000999a0009a97aa0b333333b0000000000000666700000000000000000000000000000000000000000000000
000770009a9aa9aa09a99aa000999a000009a00000999a0009a99aa0333333330000000000006666700000000000000000000000000000000000000000000000
007007009aa99aaa09a99aa000999a000009a00000999a0009a99aa0433333340000000000056666650567000000000000000000000000000000000000000000
0000000009aaaaa009aaaaa0009aaa000009a000009aaa0009aaaaa0543333450000000005565666565666700000000000000000000000000000000000000000
00000000009999000099990000099000000990000009900000999900454554540000000000556566666666670000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000055556666666667000000000000000000000000000000000000000
0000000000000000000000000000000000000000000c000000000000000000000000000000000556666666676700000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000565666666667670000000000000000000000000000000000000
00000777777000000000000000000000000000000000000000000000000000000000000000000556566666666660000000000000000000000000000000000000
00007777777700000000000070000000000000000000000000000000000000000000000000000555656666666550000000000000000000000000000e00000000
0077777676767700000000000000000000c00000000000000000000000000000000000000000555656566666666570000000000000eeeeeeeeee00eee0000000
067777776767777000000000000000000000000000000000000000000000000000000000000095555565666666656700000000000eee2222222ee0e88e000000
67777777777777770000000000070000000000000000000000000000000000000000000000009955565656666666667000000000eee222222222eeeeeee00000
76777777777777770000000000000000000000000000000000000000000000000000000000099a9555556566666666600000000eee2eeee2eeee2eeeeeee0000
6766777777767776000000000000000000000c00000000000000000000000000000000000099aaa95556565666666660000000eeeeeeee2e2eeeeeee1e1ef000
067767677767776000000000000000000000000000000000000000000000000000000000099aaaaa995555656666650000000eeeeee8eeeee2eeeeeee1eefff0
00667677777766000000000000000000000000000000000000000000000000000000000099aaaaa990005556566550000000e0eeee8eeeeeeee2eeee1e1efff0
0000676767660000000000070000000000000000000000000000000000000000000000099aaaaa990000005565550000000e00e2eeeeeeee2e2eeeeeeeeef5f0
0000000000000000000000000000000000000000000000c0000000000000000000000099aaaaa9900000000555500000000e008e2e2eeeeee2e2eeeeeeeefff0
00000000000000000700000000000000000000000000000000000000000000000000099aaaaa99000000000555000000000e008ee2eeeeee2eeeeeeee2e89990
0000000000000000000000000000000000000000000000000000000000000000000099aaaaa9900000000000000000000000e0882e2eeee2e2eeeeee2e889880
cccccc00aaaaaaaa00000000000000000000000000000000000000000000000000099aaaaa99000000000000000000000000e00888e2ee2eee2eeeeee2889980
011111100bbbbbb00000000000000000000000000000000000000000000000000099aaaaa9900000000000000000000000000e00888eeeeeeee2eeee28880088
0333333399999990000000000000000000000000000000000000000000000000099aaaaa9900000000000000000000000000e0000888eeeeeeeee88888800000
00fffff00fffff0000000000000000000000000000000000000000000000000099aaaaa990000000000000000000000000000000888888eeeeee888888800000
033333339999999000000000000000000000000000000000000000000000000099aaaa99000000000000000000000000000000d88888888eeee88888888ee600
88888888dddddddd000000000000000000000000000000000000000000000000099aa990000000000000000000000000000000d8888888888888888888888d00
0ffffff00ffffff000000000000000000000000000000000000000000000000000999900000000000000000000000000000000d8888222888888822288888d00
88888888dddddddd00000000000000000000000000000000000000000000000000099000000000000000000000000000000000d8882200088888000228888d00
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
000e00eeeee8eeeeeeeeeeee771efff00e000eeeeee8eeeeeeeeeeee771efff0000e00eeeee8eeeeeeeeeeee771efff00e000eeeeee8eeeeeeeeeeee771efff0
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
__gff__
0004040404040401000000000000000001010000000000000000000000000000000000000000000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
