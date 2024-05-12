# draw a grid

# draw an operator line
function draw_ol()
	println("+ ","- ","- ","- ","- ","- ","+ ","- ","- ","- ","- ","- ","+ ")
end

# draw separator line
function draw_sl()
	println("|           ","|           ","|" )
	println("|           ","|           ","|" )
	println("|           ","|           ","|" )
	println("|           ","|           ","|" )
end

function draw_grid(draw_ol, draw_sl)
	draw_ol()
	draw_sl()
	draw_ol()
	draw_sl()
	draw_ol()
end

# draw grid

draw_grid(draw_ol, draw_sl)


# draw a kind of grid

draw4_4= [((draw_grid(draw_ol, draw_sl), draw_grid(draw_ol, draw_sl)), ((draw_grid(draw_ol, draw_sl), draw_grid(draw_ol, draw_sl))))]


# draw a 4x4 grid

# join two results

function join(x, y)
	return x,y
end

# draw full grid lines
function full_lines(a, b)
	join(a(), b())
end

# draw full grid columns
function full_columns(a, b)
	a()
	b()
end 

# draw 4x4 grid

full_lines(draw_grid(draw_ol, draw_sl), draw_grid(draw_ol, draw_sl))
full_columns(draw_grid(draw_ol, draw_sl), draw_grid(draw_ol, draw_sl))
