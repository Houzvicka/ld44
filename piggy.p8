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
	coin.sprite = 1
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000aaa9000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000a77aa900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000a7aaa900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000770000aaaaa900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
007007000aaaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000aaaa000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
3100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
