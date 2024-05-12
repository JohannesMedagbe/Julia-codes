# draw a grid

# draw an operator line
function draw_ol()
	println("+ ","- ","- ","- ","- ","- ","+ ","- ","- ","- ","- ","- ","+ ", "+ ","- ","- ","- ","- ","- ","+ ","- ","- ","- ","- ","- ","+ ")
end

# draw separator line
function draw_sl()
	println("|           ","|           ","|", " |           ","|           ","|" )
	println("|           ","|           ","|", " |           ","|           ","|" )
	println("|           ","|           ","|", " |           ","|           ","|" )
	println("|           ","|           ","|", " |           ","|           ","|" )
end

function draw_grid(draw_ol, draw_sl)
	draw_ol()
	draw_sl()
	draw_ol()
	draw_sl()
	draw_ol()
end

# draw grid

final_grid=[draw_grid(draw_ol, draw_sl), draw_grid(draw_ol, draw_sl)]

