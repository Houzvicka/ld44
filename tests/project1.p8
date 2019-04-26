pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

function _init()
 make_player()
end

function _update()
 move_player()
end

function _draw()
 cls() --clear screen
 draw_player()
end

function make_player()
 px=64
 py=64
 psprite=1
end

function move_player()

	gravity=0.2
	
	
 if (btn(0)) px-=1 --left
 if (btn(1)) px+=1 --right
 if (btn(2)) py-=1 --up
 if (btn(3)) py+=1 --down
end

function draw_player()
 spr(psprite,px,py)
end
-->8

function make_map()

	

end
__gfx__
00000000cccccccccccc9ccccccccccccccccccccccccccc11111111ccccccccccccccccccccccccccccccccccc2ecccccc99cccc28cc88cc88cc88c00000000
00000000ccccccccccccc9cccbcccccccbccccccbccccccc12222221cccccccccccccccccccccccccccc7ccccc288ecccc9aa9cc28888f888888888800000000
00700700ccc88ccc9ccc999ccbccccbcbcccbcccbccbcccc12eeee21ccccccccccccccccccccccccccccccccc28888ecc99aa99c288888f89999979900000000
00077000ccc8accc99c9ccc9cbcccbccbcccbcbccbccbccc12e88e21ccccccccccccccccccccccccccccccccc28888ecc9aa8a9c288888f8aaaaaa7a00000000
00077000ccc88ccc9c9cccc9ccbcbccbcbccbccbccbcbccb12e88e21cccccccccccccccccc7cccccccccccccc28888ec9aa89aa922888888bbbbbbbb00000000
00700700cc8888cc99c9ccc9cbcccbcbccbccbcbccbcbcbc12eeee21ccccccccccccccccccccccccccccccccc21881ec9a9898a9c228888cc111111c00000000
00000000cc8cc8cc9ccc999cbcccbccbcbccbcbccbccbcbc12222221cccccccccccccccccccccccccccccccccc1881cc9a9a98a9cc2288ccccc22ccc00000000
00000000c8cccc8cccccc9cccbccbcbccbcbccbcbccbccbc11111111cccccc7cccccccccccccccccccccc7ccc1c22c1cca9a98acccc22ccccccccccc00000000
40444404effffffe00000000ccc8888c00000000cccacacc00000000cccccccccccccccccccccccccccccccccccc0ccccccc0000000000000000000000000000
043333400eeeeeef00000000c888888c00000000ccaaaacc00000000cccccccccccccccccccccc7ccccccccccccc00ccccc0ccc0000000000000000000000000
433333340eeeeeef00000000ccc9099c00000000c9aaa9cc00000000cccccccccccccccccccccccccccccccccccc0c0ccc0cccc0000000000000000000000000
433333340eeeeeef00000000ccc9999c00000000cc9889cc00000000cccc7ccccccccccccccccccccccccccccccc0c0ccc0cccc0000000000000000000000000
433333340eeeeeef00000000ccccbbbc00000000cc989ccc00000000cccccccccccccccccccccccccccccccccc0000cccc0cc000000000000000000000000000
433333340eeeeeef00000000ccccbc3c00000000ccc94ccc00000000cccccccccccccccccccccccccccccccccc000ccc000cc000000000000000000000000000
043333400eeeeeef00000000ccccb33c00000000ccc44ccc00000000cccccccccccccccccccccccccccccccccc000ccc000cc000000000000000000000000000
404444042222222e00000000cccbbccc00000000ccc44ccc00000000ccccccccc7cccccccccccccccccc7ccccccccccc000ccccc000000000000000000000000
cc9aa7cccc9aa7cc00000000ccc8888c000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
c9aaaa7cc9aaaa7c00000000c888888c000000000000000000000000cccccccccccccccc7ccccccccccccccc0000000000000000000000000000000000000000
9a1aa1a79a1aaaa700000000ccc9099c000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
9aaaaaaa9aaaaaaa00000000ccc9999c000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
9a1111aa9a1111aa00000000ccccbbbc000000000000000000000000ccccc7cccccccccc7ccccccccccccccc0000000000000000000000000000000000000000
9aa11aaa9aa11aaa00000000ccccbc3c000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
c9aaaaacc9aaaaac00000000cccbbc3c000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
cc9999cccc9999cc00000000ccccc33c000000000000000000000000ccc7cccccccccccccccccccc7ccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000cccccccc7ccccccccccccccccccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000cccccc7ccccccccc7ccccccccccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000cccccccccccccccccccccccccccccccc0000000000000000000000000000000000000000
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888ffffff882222228888888888888888888888888888888888888888888888888888888888888888228228888ff88ff888222822888888822888888228888
88888f8888f882888828888888888888888888888888888888888888888888888888888888888888882288822888ffffff888222822888882282888888222888
88888ffffff882888828888888888888888888888888888888888888888888888888888888888888882288822888f8ff8f888222888888228882888888288888
88888888888882888828888888888888888888888888888888888888888888888888888888888888882288822888ffffff888888222888228882888822288888
88888f8f8f88828888288888888888888888888888888888888888888888888888888888888888888822888228888ffff8888228222888882282888222288888
888888f8f8f8822222288888888888888888888888888888888888888888888888888888888888888882282288888f88f8888228222888888822888222888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000000000000000000000000000000000005555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000011111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557777777777771111111112222222222333333333305555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557000000000075555555556666666666777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557044444444075555555556666666666777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557044444444075555555556666666666777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557044444444075555555556666666666777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557044444444075555555556666666666777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557044444444075555555556666666666777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557044444444075555555556666666666777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557044444444075555555556666666666777777777705555555
55555550000000000000000000000000000000000000000000000000000000000000000005555557000000000075555555556666666666777777777705555555
5555555000000000000000000000000000000000000000000000000000000000000000000551555777777777777999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000517155088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000517715088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000517771088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000517777188888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000517711088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000551171088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555088888888889999999999aaaaaaaaaabbbbbbbbbb05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550ccccccccccddddddddddeeeeeeeeeeffffffffff05555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000000000000000000000000000000000000005555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555556667655555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555555666555555555555555555555555555555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555000000055555556dddddddddddddddddddddddd5555555555
555555500000000000000000000000000000000000000000000000000000000000000000055555500040005555555655555555555555555555555d5555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555555576666666d6666666d666666655555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550000000555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555556665666555556667655555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555556555556555555666555555555555555555555555555555555
5555555000000000000000000000000000000000000000000000000000000000000000000555555555555555555556dddddddddddddddddddddddd5555555555
555555500000000000000000000000000000000000000000000000000000000000000000055555565555565555555655555555555555555555555d5555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555556665666555555576666666d6666666d666666655555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555550005550005550005550005550005550005550005550005555
555555500000000000000000000000000000000000000000000000000000000000000000055555011d05011d05011d05011d05011d05011d05011d05011d0555
55555550000000000000000000000000000000000000000000000000000000000000000005555501110501110501110501110501110501110501110501110555
55555550000000000000000000000000000000000000000000000000000000000000000005555501110501110501110501110501110501110501110501110555
55555550000000000000000000000000000000000000000000000000000000000000000005555550005550005550005550005550005550005550005550005555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555550000000000000000000000000000000000000000000000000000000000000000005555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555550000000055555555555555555555555555555555555555555555555555
55555555555555555555555557555555ddd5555d5d5d5d5555d5d55555555d555555550000000056666666666666555557777755555555555555555555555555
55555555555555555555555577755555ddd555555555555555d5d5d5555555d55555550000000056ddd6ddd6dd66555577ddd775566666555666665556666655
55555555555555555555555777775555ddd5555d55555d5555d5d5d55555555d5555550000000056d6d6d6d66d66555577d7d77566dd666566ddd66566ddd665
55555555555555555555557777755555ddd555555555555555ddddd555ddddddd555550000000056d6d6d6d66d66555577d7d775666d66656666d665666dd665
555555555555555555555757775555ddddddd55d55555d55d5ddddd55d5ddddd5555550000000056d6d6d6d66d66555577ddd775666d666566d666656666d665
555555555555555555555755755555d55555d555555555555dddddd55d55ddd55555550000000056ddd6ddd6ddd655557777777566ddd66566ddd66566ddd665
555555555555555555555777555555ddddddd55d5d5d5d55555ddd555d555d555555550000000056666666666666555577777775666666656666666566666665
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555566666665ddddddd5ddddddd5ddddddd5
00000007777777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700707000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077007000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077007000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700707000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007777777777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__map__
073a3a073a3a273a3a3a3a3a3a3a3a3a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3a3a0d3a3a3a3a3a3a3a18183a0b293a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3a203a073a3a0e3a3a3a01183a0c3a3a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3a273a293a023a3a3a1818173a3a3a3a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
3a3a3a3a030305040504041c3a171b3a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1503050410101010101010051323031500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010060606060610101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0606060606061111110606060606060600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000100001f0502305023050160501a050000001e050210502305025050240501e0501b0501705017050190501d050230502d05029050240501705015050170501a05019050160501405000000000000000000000
000f0000180501a0501c0501d0501f0502105023050240500d0500f0501205014050160500c0500e0501005011050130501505017050000000000000000000000000000000000000000000000000000000000000
__music__
00 01424344

