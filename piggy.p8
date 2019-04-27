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
0000000009aaaa7009aaaa70009aa70000097000009aa70009aaaa70b433334b000000000000000000000000000c000000000000000000700000000000000000
007007009aa97aa709a97aa000997a000009a00000997a0009a97aa0433333340000000000000000000000000000000000000000000000670000000000000000
000770009a9aa7a709a97aa000999a000009a00000999a0009a97aa0b333333b0000077777700000000000000000000000000000000006667000000000000000
000770009a9aa9aa09a99aa000999a000009a00000999a0009a99aa0333333330000777777770000000000000000000000000000000066667000000000000000
007007009aa99aaa09a99aa000999a000009a00000999a0009a99aa043333334007777767676770000c000000000000000000000000566666505670000000000
0000000009aaaaa009aaaaa0009aaa000009a000009aaa0009aaaaa0543333450677777767677770000000000000000000000000055656665656667000000000
00000000009999000099990000099000000990000009900000999900454554546777777777777777000000000000000000000000005565666666666700000000
00000000111111112222222233333333444444445555555566666666777777777677777777777777000000000000000000000000000555566666666670000000
0000000011111111222222223333333344444444555555556666666677777777676677777776777600000c000000000000000000000005566666666767000000
00000000111111112222222233333333444444445555555566666666777777770677676777677760000000000000000000000000000005656666666676700000
00000000111111112222222233333333444444445555555566666666777777770066767777776600000000000000000000000000000005565666666666600000
00000000111111112222222233333333444444445555555566666666777777770000676767660000000000000000000000000000000005556566666665500000
0000000011111111222222223333333344444444555555556666666677777777000000000000000000000000000000c000000000000055565656666666657000
00000000111111112222222233333333444444445555555566666666777777770000000000000000000000000000000000000000000095555565666666656700
00000000111111112222222233333333444444445555555566666666777777770000000000000000000000000000000000000000000099555656566666666670
8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff000000000000000000000000000000000000000000099a955555656666666660
8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff00000000000000000000000000000000000000000099aaa95556565666666660
8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff0000000000000000000000000000000000000000099aaaaa9955556566666500
8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff000000000000000000000000000000000000000099aaaaa99000555656655000
8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff00000000700000000000000000000000000000099aaaaa990000005565550000
8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff0000000000000000000000000000000000000099aaaaa9900000000555500000
8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff000000000000000000000000000000000000099aaaaa99000000000555000000
8888888899999999aaaaaaaabbbbbbbbccccccccddddddddeeeeeeeeffffffff00000000000700000000000000000000000099aaaaa990000000000000000000
cccccc00aaaaaaaa0000000000000000000000000000000000000000000000000000000000000000000000000000000000099aaaaa9900000000000000000000
011111100bbbbbb0000000000000000000000000000000000000000000000000000000000000000000000000000000000099aaaaa99000000000000000000000
033333339999999000000000000000000000000000000000000000000000000000000000000000000000000000000000099aaaaa990000000000000000000000
00fffff00fffff000000000000000000000000000000000000000000000000000000000000000000000000000000000099aaaaa9900000000000000000000000
03333333999999900000000000000000000000000000000000000000000000000000000700000000000000000000000099aaaa99000000000000000000000000
88888888dddddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000099aa990000000000000000000000000
0ffffff00ffffff00000000000000000000000000000000000000000000000000700000000000000000000000000000000999900000000000000000000000000
88888888dddddddd0000000000000000000000000000000000000000000000000000000000000000000000000000000000099000000000000000000000000000
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
0004040404040401010100000000000001010101000000000000000000000000010101010000000000000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
