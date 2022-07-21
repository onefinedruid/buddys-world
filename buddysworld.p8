pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()
s=1 -- sprite
d=3 -- delay anim
x=0
mapscr=0  -- map screen
a=32  -- map `y' offset
m=0 -- sprite `x'
g=95 -- sprite `y'
f=false -- flip
w=false -- walking
j=false -- jumping
l=false -- jump(flag)
c=false -- collision
h=7 -- health
t=false -- talking flag
cx=63 -- cat.x
cdx=true -- r:true/l:false
end
--------------
function _draw()
	cls()
	spr(s,m,g,1,1,f) -- pc
	map(0,0,x,a,128,64) -- overworld
	rect(127,0,119,32,7) -- h-bar
	p=23 for h=1,h do 
		spr(48,120,p,1,1) -- health
		p=p-4
	end
	print("x:"..x)	
-- overworld
	if x<=-72 and x>=-81 then
	  if mapscr==0 then
			  print("🅾️ to interact",40,16)
			end
			if btn(4) and mapscr==0 then
			  farmer() 
			end
	end
	if x<=-147 and x>=-149 then
	  if mapscr==0 then
			  print("🅾️ to enter",40,16)
			end
			if btn(4) and mapscr==0 then
			  barn() 
			end
 end
 if x<=-508 and x>=-510 then
 		if mapscr==0 then
 				print("🅾️ to enter",40,16)
 		end
 end
-- barn
 if a==-96 then
 -- cat
   spr(34,cx,48,1,1,false) 
 end 
end
--------------
function _update()

--left button
	if btn(0) then
 	if j==false then g=g end
		walkanim()
		f=true
		w=true
		if x==0 then -- static move
		  m=m-1 end
		if m==63 and mapscr==0 then -- scrolling
		  x=x+1 
		end
		if m<=0 then
		  m=0 end
	elseif btn(1)==false then
		w=false
	end
--right button
	if btn(1) then
	 if j==false then g=g 
	 end
	 walkanim()
		f=false
		w=true
		if m<63 then -- static move
		  m=m+1 end
		if m==63 and mapscr==0 then -- scrolling
		  x=x-1 end
		if m>=63 and mapscr==1 then
		  m=m+1 end
		if m>= 120 and mapscr==1 then
		  m=120 end
	elseif btn(0)==false then
		w=false
	end
	
--jump	
	if btn(5) and l==false then
	  s=4
	  g=g-1
 elseif g<=94 then 
   s=4
   l=true 
	  g=g+1
	  if g==94 then 
	    l=false 
	    g=g
	  end
	-- collision: 
	-- if c = true then g=?
 else
   l=false
   s=s   
	end

--action
	if btn(4) then
	  if t==false then 
     t=true
   end
   if t==true then
     t=false
   end
 end 
	
	if w==false then 
	 s=1 
	end
	
	if mapscr==1 and a==-96 then
	  catanim()
	end	
end 
--------------
function walkanim()
d=d-1
	if d<0 then
		s=s+1
	 if s>3 then s=2 end
	 d=4
	end
end

function farmer()
  t=true
  print("the cat is making\nmischief in the barn.",5,105)
end  

function barn()
		mapscr=1
		a=-96
		x=0
end

function catanim()
		if cx<124 and cdx==true 
		   then cx=cx+1 end
		if cx==123 then cdx=false end
		if cx>-2 and cdx==false 
			  then cx=cx-1 end
		if cx==-1 then cdx=true end
end
		
__gfx__
00000000000000000000000000000000000000000077000070070700000000000000000070707070000007700000000000000000077000000000070000000000
00000000700007000700070070000700070007000007000007077000000700000000000070707070000077000000000000000000007700000000070000000000
00000000700007777000077770000777700007770007000000770070000700000000000070707070000770000000000000000000000770000000070000000000
00000000777777777777777777777777777777770007000070070700000770000000000070707070007700000000000000000000000077000000070000000000
00000000777777707777777077777770777777700007000007077000007700000000000070707070077000000000000000000000000007700000070000000000
00000000077777700777777007777770077777700007000000770000000707000000000070707070770000000000000000000000000000770000070000000000
00000000077007700770077007700770070770700007000000070700070770000000000070707070700000000000000770000000000000070000070000000000
00000000077007700700007000700700007007007777777707077000007700707777777777777777777777770000007777000000777777777777777700000000
000ee000000000000000000000000000000007000000000000000000000700000000000700000000000000000000000007000000070000000000000000000000
000ffe00000880000008800000088000700007770000070000000700000700000000007007000000000000000000000070700000007000000000000000000000
00ccce00008ff000008ff000008ff000777777777000077770000777000770000000770707777000000077777777000000000000000770000000000000000000
000cf000000ccc00000ccc00000ccc00777777707777777777777777007700000007007000707000000700000000700070000000000070000000000000000000
0009f000000fc000000fc000000fc000077777707777777077777770000707000007070000007000007000000000070000000000000007000000000000000000
000fff00000f9000000f900000ff9000070770700777777007777770070770000770707000000770007000000000070000000000000000770000000000000000
000f000000fff000000ff000000ff000007007000770077707077070007700700707000000000070007000000000070000000000000000070000000700000000
777777770000f000000ff000000f0000000000000707007000700700777777777070700000000007007000000000070000000000000000000000007700000000
77777777000000000000000000007777777700000000000770000000700700000000000070700000000007000000000007070707000007070700000000000000
70777707000770000700700000777000000777000000007007000000070700000000000070700000000007000000000007070707000007070070000000000000
00777700007777000077000000070007700070000000070000700000007770000000000070700000000007000000000007070707000007070007700000000000
00700700000770000077000007770007700077700000700000070000007700000000000070700000000007007777777707070707000007070000700000000000
00700700000770000077700000700007700007000007000000007000000777000000000070700000000007000000000007070707000007070000070000000000
00700700007077000077770707700070070007700070000000000700070777000000000070700000000007000000000007070707000007070000007700000000
07707700070777700077770700700700007007000700000000000070007700700000000070700000000007000000000007070707000007070000000700000000
77777777077077700077777707707000000707707000000000000007777777770000000077777777000007007777777777777777777777777777777700000000
00000000000000000000000000000000000000000000000000000000000707000000000770000000000000007070707070700000000007070070000000000000
00000000000000000000000000000000000000000000000000000000000707000000077777707000070007000700070070700000000007070070000000000000
00000000000000000000000000000000000000000000000000000000000777000000770000770000070007007070707070700000000007070070000000000000
00000000000000000000000000000000000000000000000000000000007707000707007007007000707070700700070070700000000007070070000000000000
00000000000000000000000000000000000000000000000000000000000707000070000000000700070007007070707070700000000007070070000000000000
07777700000000000000000000000000000000000000000000000000070777000777000000007770707070700700070070700000000007070070000000000000
07777700000000000000000000000000000000000000000000000000007707700700000000000070070007007070707070700000000007070070000000000000
07777700000000000000000000000000000000000000000000000000777777777777777777777777707070707070707070700000000007077777777700000000
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888eeeeee888888888888888888888888888888888888888888888888888888888888888888888888ff8ff8888228822888222822888888822888888228888
8888ee888ee88888888888888888888888888888888888888888888888888888888888888888888888ff888ff888222222888222822888882282888888222888
888eee8e8ee88888e88888888888888888888888888888888888888888888888888888888888888888ff888ff888282282888222888888228882888888288888
888eee8e8ee8888eee8888888888888888888888888888888888888888888888888888888888888888ff888ff888222222888888222888228882888822288888
888eee8e8ee88888e88888888888888888888888888888888888888888888888888888888888888888ff888ff888822228888228222888882282888222288888
888eee888ee888888888888888888888888888888888888888888888888888888888888888888888888ff8ff8888828828888228222888888822888222888888
888eeeeeeee888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1e1e1ee111ee1eee1eee11ee1ee1111111111666166116661666117111711111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e111111111161161611611161171111171111111111111111111111111111111111111111111111111111111111111111
1ee11e1e1e1e1e1111e111e11e1e1e1e111111111161161611611161171111171111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e111111111161161611611161171111171111111111111111111111111111111111111111111111111111111111111111
1e1111ee1e1e11ee11e11eee1ee11e1e111116661666161616661161117111711111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
116611111cc1111111111111111111dd1ddd1ddd1ddd1ddd1ddd1111111111111111111111111111111111111111111111111111111111111111111111111111
1611177711c111111111111111111d111d1d1d1d11d111d11d111111111111111111111111111111111111111111111111111111111111111111111111111111
1666111111c111111ddd1ddd11111ddd1ddd1dd111d111d11dd11111111111111111111111111111111111111111111111111111111111111111111111111111
1116177711c11111111111111111111d1d111d1d11d111d11d111111111111111111111111111111111111111111111111111111111111111111111111111111
166111111ccc11111111111111111dd11d111d1d1ddd11d11ddd1111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
166111111ccc11111111111111111dd11ddd1d111ddd1d1d11111ddd1dd11ddd1ddd111111111111111111111111111111111111111111111111111111111111
16161777111c11111111111111111d1d1d111d111d1d1d1d11111d1d1d1d11d11ddd111111111111111111111111111111111111111111111111111111111111
1616111111cc11111ddd1ddd11111d1d1dd11d111ddd1ddd11111ddd1d1d11d11d1d111111111111111111111111111111111111111111111111111111111111
16161777111c11111111111111111d1d1d111d111d1d111d11111d1d1d1d11d11d1d111111111111111111111111111111111111111111111111111111111111
166611111ccc11111111111111111ddd1ddd1ddd1d1d1ddd11111d1d1d1d1ddd1d1d111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
161611111ccc11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
161617771c1c11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
116111111c1c11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
161617771c1c11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
161611111ccc11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
16661666166611661166166611111ccc111111111111111111111ddd1ddd1ddd111111dd11dd1ddd1ddd1ddd1dd1111111111111111111111111111111111111
16661616161616111611161617771c1c111111111111111111111ddd1d1d1d1d11111d111d111d1d1d111d111d1d111111111111111111111111111111111111
16161666166616661611166111111c1c111111111ddd1ddd11111d1d1ddd1ddd11111ddd1d111dd11dd111d11d1d111111111111111111111111111111111111
16161616161111161611161617771c1c111111111111111111111d1d1d1d1d111111111d1d111d1d1d1117111d1d111111111111111111111111111111111111
16161616161116611166161611111ccc111111111111111111111d1d1d1d1d1111111dd111dd1d1d1ddd17711d1d111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111117771111111111111111111111111111111111111111
166611111ccc111111111111111111111ddd1ddd1ddd111111d11d1d11d1111111dd1ddd1ddd11dd1ddd17777111111111111111111111111111111111111111
161617771c1c111111111111111111111ddd1d1d1d1d1111111d1d1d1d1111111d1d1d111d111d111d1117711111111111111111111111111111111111111111
166611111c1c111111111ddd1ddd11111d1d1ddd1ddd111111111ddd111111111d1d1dd11dd11ddd1dd111171111111111111111111111111111111111111111
161617771c1c111111111111111111111d1d1d1d1d1111111111111d111111111d1d1d111d11111d1d1111d11111111111111111111111111111111111111111
161611111ccc111111111111111111111d1d1d1d1d11111111111ddd111111111dd11d111d111dd11ddd11d11111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
166611111c111ccc111111111111111111dd1ddd1ddd1ddd1ddd1ddd111111d11d1d11d111111111111111111111111111111111111111111111111111111111
166617771c11111c11111111111111111d111d1d1d1d11d111d11d111111111d1d1d1d1111111111111111111111111111111111111111111111111111111111
161611111ccc11cc11111ddd1ddd11111ddd1ddd1dd111d111d11dd11111111111d1111111111111111111111111111111111111111111111111111111111111
161617771c1c111c1111111111111111111d1d111d1d11d111d11d11111111111d1d111111111111111111111111111111111111111111111111111111111111
161611111ccc1ccc11111111111111111dd11d111d1d1ddd11d11ddd111111111d1d111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
116611111c111ccc111111111111111111dd1ddd1ddd1ddd1ddd1ddd111111d11d1d11d111111111111111111111111111111111111111111111111111111111
161117771c11111c11111111111111111d111d1d1d1d11d111d11d111111111d1d1d1d1111111111111111111111111111111111111111111111111111111111
161111111ccc11cc11111ddd1ddd11111ddd1ddd1dd111d111d11dd1111111111ddd111111111111111111111111111111111111111111111111111111111111
161617771c1c111c1111111111111111111d1d111d1d11d111d11d1111111111111d111111111111111111111111111111111111111111111111111111111111
166611111ccc1ccc11111111111111111dd11d111d1d1ddd11d11ddd111111111ddd111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
166611111ccc1ccc1c1111cc1ccc11111111111111111ddd1d111ddd1ddd11111111111111111111111111111111111111111111111111111111111111111111
161117771c111c1c1c111c111c1111111111111111111d111d1111d11d1d11111111111111111111111111111111111111111111111111111111111111111111
166111111cc11ccc1c111ccc1cc111111ddd1ddd11111dd11d1111d11ddd11111111111111111111111111111111111111111111111111111111111111111111
161117771c111c1c1c11111c1c1111111111111111111d111d1111d11d1111111111111111111111111111111111111111111111111111111111111111111111
161111111c111c1c1ccc1cc11ccc11111111111111111d111ddd1ddd1d1111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
161611111ccc1ccc1c1111cc1ccc11111111111111111d1d1ddd1d111d1d1ddd1dd111dd11111111111111111111111111111111111111111111111111111111
161617771c111c1c1c111c111c1111111111111111111d1d1d1d1d111d1d11d11d1d1d1111111111111111111111111111111111111111111111111111111111
161611111cc11ccc1c111ccc1cc111111ddd1ddd11111d1d1ddd1d111dd111d11d1d1d1111111111111111111111111111111111111111111111111111111111
166617771c111c1c1c11111c1c1111111111111111111ddd1d1d1d111d1d11d11d1d1d1d11111111111111111111111111111111111111111111111111111111
166611111c111c1c1ccc1cc11ccc11111111111111111ddd1d1d1ddd1d1d1ddd1d1d1ddd11111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
166611111ccc1ccc1c1111cc1ccc11111111111111111ddd1d1d1ddd1ddd1ddd1dd111dd11111111111111111111111111111111111111111111111111111111
116117771c111c1c1c111c111c11111111111111111111d11d1d1ddd1d1d11d11d1d1d1111111111111111111111111111111111111111111111111111111111
116111111cc11ccc1c111ccc1cc111111ddd1ddd111111d11d1d1d1d1ddd11d11d1d1d1111111111111111111111111111111111111111111111111111111111
116117771c111c1c1c11111c1c11111111111111111111d11d1d1d1d1d1111d11d1d1d1d11111111111111111111111111111111111111111111111111111111
166111111c111c1c1ccc1cc11ccc11111111111111111dd111dd1d1d1d111ddd1d1d1ddd11111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
161111111ccc1ccc1c1111cc1ccc11111111111111111ddd1d1d1ddd1ddd11d11ddd1d111ddd11dd11d111111111111111111111111111111111111111111111
161117771c111c1c1c111c111c11111111111111111111d11d1d1ddd1d1d1d111d111d111d1d1d11111d11111111111111111111111111111111111111111111
161111111cc11ccc1c111ccc1cc111111ddd1ddd111111d11d1d1d1d1ddd1d111dd11d111ddd1d11111d11111111111111111111111111111111111111111111
161117771c111c1c1c11111c1c11111111111111111111d11d1d1d1d1d111d111d111d111d1d1d1d111d11111111111111111111111111111111111111111111
166611111c111c1c1ccc1cc11ccc11111111111111111dd111dd1d1d1d1111d11d111ddd1d1d1ddd11d111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
116611111ccc1ccc1c1111cc1ccc111111111111111111dd11dd1d111d111ddd11dd1ddd11dd1dd1111111111111111111111111111111111111111111111111
161117771c111c1c1c111c111c1111111111111111111d111d1d1d111d1111d11d1111d11d1d1d1d111111111111111111111111111111111111111111111111
161111111cc11ccc1c111ccc1cc111111ddd1ddd11111d111d1d1d111d1111d11ddd11d11d1d1d1d111111111111111111111111111111111111111111111111
161117771c111c1c1c11111c1c1111111111111111111d111d1d1d111d1111d1111d11d11d1d1d1d111111111111111111111111111111111111111111111111
116611111c111c1c1ccc1cc11ccc111111111111111111dd1dd11ddd1ddd1ddd1dd11ddd1dd11d1d111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
161611111c1111111111111111111d1d1ddd1ddd1d111ddd1d1d1111111111111111111111111111111111111111111111111111111111111111111111111111
161617771c1111111111111111111d1d1d111d1d1d1111d11d1d1111111111111111111111111111111111111111111111111111111111111111111111111111
166611111ccc11111ddd1ddd11111ddd1dd11ddd1d1111d11ddd1111111111111111111111111111111111111111111111111111111111111111111111111111
161617771c1c11111111111111111d1d1d111d1d1d1111d11d1d1111111111111111111111111111111111111111111111111111111111111111111111111111
161611111ccc11111111111111111d1d1ddd1d1d1ddd11d11d1d1111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
166611111ccc1ccc1c1111cc1ccc11111111111111111ddd1ddd1d111d1d1ddd1dd111dd11111ddd1d111ddd11dd111111111111111111111111111111111111
116117771c111c1c1c111c111c11111111111111111111d11d1d1d111d1d11d11d1d1d1111111d111d111d1d1d11111111111111111111111111111111111111
116111111cc11ccc1c111ccc1cc111111ddd1ddd111111d11ddd1d111dd111d11d1d1d1111111dd11d111ddd1d11111111111111111111111111111111111111
116117771c111c1c1c11111c1c11111111111111111111d11d1d1d111d1d11d11d1d1d1d11111d111d111d1d1d1d111111111111111111111111111111111111
116111111c111c1c1ccc1cc11ccc111111111111111111d11d1d1ddd1d1d1ddd1d1d1ddd11111d111ddd1d1d1ddd111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1ee11ee111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ee11e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1e1e1eee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd1ddd111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1e1e1ee111ee1eee1eee11ee1ee1111111111616166616611666166616661171117111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e111111111616161616161616116116111711111711111111111111111111111111111111111111111111111111111111
1ee11e1e1e1e1e1111e111e11e1e1e1e111111111616166616161666116116611711111711111111111111111111111111111111111111111111111111111111
1e111e1e1e1e1e1111e111e11e1e1e1e111111111616161116161616116116111711111711111111111111111111111111111111111111111111111111111111
1e1111ee1e1e11ee11e11eee1ee11e1e111116661166161116661616116116661171117111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
82888222822882228888822888828228822282828888888888888888888888888888888888888888888888888282822282228882822282288222822288866688
82888828828282888888882888288828888282828888888888888888888888888888888888888888888888888282888288828828828288288282888288888888
82888828828282288888882888288828882282228888888888888888888888888888888888888888888888888222822288228828822288288222822288822288
82888828828282888888882888288828888288828888888888888888888888888888888888888888888888888882828888828828828288288882828888888888
82228222828282228888822282888222822288828888888888888888888888888888888888888888888888888882822282228288822282228882822288822288
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__gff__
0000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000018190000000000000000000000000000000000000000000000000000
00000000001819000000000000000018190000000000000000000018190000000000000000181d0000000000000000000018190000000000000000000000000000181900000000000000000000181900000000000000001819000000000000000000001800001900000000000000000000000000000000000018190000000000
00000000181c0019000000000000181c00190000000000000000181c0019000000000000181c001d18190000181900001800001900000000181900001819000018000019000000000000000018000019000018190000180000190000000018190000180000000019000018190000000018190000000000001800001900001819
001819181c0000001900001819181c00000019181900001819181c00000019181d0000181c0000181c0019181c0019180000000019181918000019180000191800000000191819000018191800000000191800001918000000001918191800001918000000000018191800001900001800001918190000180018190019180000
181c001d000000000019181c001d00000000181c0019181c001d1e080808181c001d181c000000000000181c000000190000000018000019000018000000001900000000180000191800001900000000180000000019000000001800001900000019000000001800001900000019180000001800001918001800001900190000
000000000000000000000000000000000000000000000000001e0a0d08080d00000000000000000000000000000000000000000000000000000000000000000000000018000000000000000019000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000700070000070700000700000700000000000700000007000a38390d080727000007070700070700070007000000000000000000000000000000000000070007070700070000000000000700070000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00060006000006060000060000060000000021060000000600093f3f2c2c0606000006060600060600060006000000003b3b3b3b3b3b3b3b3b3b3b3b0000060006060600061717232417170600060000060000000000000000000000000000000000003a3a3a3a003a3a003a3a3a3a0000000000000000000000000000000000
080508050808050508080508080508170808200508170805170908082c171717170805050508050508050805080808080909090909090909090909090808050805050508050825000026080508051717050808080808080808080808080808080808083b3b3b3b083b3b083b3b3b3b0808080808080808080808080808103839
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2500250025002500002600260026000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0025002500250025260026002600260000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
250025002500250b0c2600260026000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
002500250025001a1b0026002600260000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
250025002500003e0e0000260026002600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0025002500000000000000002600260026000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808083839383908083839383908080808080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
360000003c0000000000003d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003c0000000000003d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
38393839290000000000002d3839383900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003c0000000000003d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003c0000000000003d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
38393839290808080808082d3839383908080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
