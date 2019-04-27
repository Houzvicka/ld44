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
 animate_coin()
end

function _draw()
 cls()
 map(0, 0, 0, 0, 128, 32)
 draw_player()
 draw_coin()
end

function wait(a) 
	for i = 1,a do 
		flip() 
	end 
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
	player.sprite = 16
end

function move_player()

	player.dy = gravity
	
	--jump
 if (btnp(2)) then
  player.dy-=11
 end
 
 --move player right
 if btn(1) then
   player.x+=1 --right
 end
 
 --move player left
 if btn(0) then
   player.x-=1 --left
 end
 
 --move to new position
 player.y+=player.dy
end

<<<<<<< HEAD
function draw_player()	
 spr(player.sprite,player.x,player.y)
=======
function draw_player()
	spr(player.sprite,10,10,2,2)
>>>>>>> d7943a7e76e9b07aaf061b78bc3535e3b8689394
end
-->8
//coin

function make_coin()
	coin = {}
	coin.x = 0
	coin.y = 0
	coin.dy = 0
	coin.value = 0
	coin.sprite = 1
end

function animate_coin()
	coin.sprite+=1
 if (coin.sprite==6) coin.sprite=1
	wait(3)
end

function move_coin()
	
end

function check_collision()
	if(hit(coin.x+2,coin.y+2,6,6)) then
	end
end

function draw_coin()
 spr(coin.sprite,0,0)
 --print(collide)
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
//global

gravity=1
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
0000eeeeeee000000000eeeeeee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000ee22222ee0000000ee22222ee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ee2eeeee2ee00000ee2eeeee2ee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
e0eeeeeeeeeef00000eeeeeeeeeef000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
eeeeeeeeeee1ef00eeeeeeeeeee1ef00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008eeeeeeeeeeef0e08eeeeeeeeeeef0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008eeeeeeeeeeee0008eeeeeeeeeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008eeeeeeeeeeee0008eeeeeeeeeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0008eeeeeeee88000008eeeeeeee8800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00028888888800000002888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00020e0020e0000000020e0020e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00020e0020e0000000020e0020e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000e0000e000000002000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4b4bb4b4000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b433334b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43333334000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b333333b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
43333334000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
54333345000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
45455454000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000eeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000eeeeeffffff777ee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000eeeeefffff777ffffe0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000eeeeef2222222222fffe000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000eeeeff2222222222fffee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000eeeef22eeeeeeeeee22fee00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000eeeef2eeeeeeeeeeee2feee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000eeeee2eeeeeeeeeeeeee2eee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000eeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000eeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000eeeeeeeeeeeeeeeeeeeee17eeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000eeeeeeeeeeeeeeeeeeeee11eeeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000eeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008eeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
008eeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0888eeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
888888eeeeeeeeeeeeeeeeeeeeeeeee8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8888888eeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00888888eeeeeeeeeeeeeeeeeeeee880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000088888eeeeeeeeeeeeeeeeeee8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00008888888eeeeeeeeeeeeeeeee8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000888888888eeeeeeeeeeee880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000088888888888888888888880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000888888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088888888888888888800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088ef22000000288ef000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008ef82200000028ef8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000008ef80000000008ef8000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000001000040414243000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000050515253000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000010110060616263000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000020210070717273000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3030303030303030303030303030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
0000000000000000000000000000000000000000000000000000000000000000000000000000000040414243000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000050515253000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000060616263000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000070717273000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000010110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000020210000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000003030303030303030303030303030303000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000