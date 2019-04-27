pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

//main

function _init()
 game_over=false
 make_player()
 make_coin()
end

function _update()
 move_player()
 check_collision()
end

function _draw()
 cls()
 draw_player()
 draw_coin()
end
-->8
//player

function make_player()
	player = {}
	player.x = 0
	player.y = 0
	player.dy = 0
	player.lives = 0
	player.ncoin = 0
	player.sprite = 0
end

function move_player()
	
end

function draw_player()
	
end
-->8
//coin

function make_coin()
	coin = {}
	coin.x = 0
	coin.y = 0
	coin.dy = 0
	coin.value = 0
	coin.sprite = 0
end

function move_coin()
	
end

function check_collision()
	if(hit(coin.x+2,coin.y+2,6,6)) then
	end
end

function draw_coin()
	map(0, 0, 0, 0, 128, 32)
 spr(coin.sprite,0,0)
 print(collide)
end

function hit(x,y,w,h)
  collide=false
  for i=x,x+w,w do
    if (fget(mget(i/8,y/8))>0) or
         (fget(mget(i/8,(y+h)/8))>0) then
          collide=true
    end
  end
  
  for i=y,y+h,h do
    if (fget(mget(x/8,i/8))>0) or
         (fget(mget((x+w)/8,i/8))>0) then
          collide=true
    end
  end
  
  return collide
end
-->8
//hammer
-->8
//
__gfx__
00000000009aa700009aa700000970000009700000097000009aa700000000000000000000000000000000000000000000000000000000000000000000000000
0000000009aaaa7009aaaa70009aa70000097000009aa70009aaaa70000000000000000000000000000000000000000000000000000000000000000000000000
007007009aa97aa709a97aa000997a000009a00000997a0009a97aa0000000000000000000000000000000000000000000000000000000000000000000000000
000770009a9aa7a709a97aa000999a000009a00000999a0009a97aa0000000000000000000000000000000000000000000000000000000000000000000000000
000770009a9aa9aa09a99aa000999a000009a00000999a0009a99aa0000000000000000000000000000000000000000000000000000000000000000000000000
007007009aa99aaa09a99aa000999a000009a00000999a0009a99aa0000000000000000000000000000000000000000000000000000000000000000000000000
0000000009aaaaa009aaaaa0009aaa000009a000009aaa0009aaaaa0000000000000000000000000000000000000000000000000000000000000000000000000
00000000009999000099990000099000000990000009900000999900000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000eeeeeee000000000eeeeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000ee22222ee0000000ee22222ee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000ee2eeeee2ee00000ee2eeeee2ee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000feeeeeeeeee0e000feeeeeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00fe1eeeeeeeeeee00fe1eeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0feeeeeeeeeee8000feeeeeeeeeee80e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0eeeeeeeeeeee8000eeeeeeeeeeee800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0eeeeeeeeeeee8000eeeeeeeeeeee800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0088eeeeeeee80000088eeeeeeee8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00008888888820000000888888882000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000e0200e0200000000e0200e02000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000e0200e0200000000e0200e02000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000e0000e000000000000200002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4b4bb4b4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b433334b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43333334000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b333333b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43333334000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
54333345000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
45455454000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000010110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000020210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000003030303030303030303030303030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
