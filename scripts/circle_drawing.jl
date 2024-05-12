# draw a circle passing 2 arguments

using ThinkJulia

🐢 = Turtle()

function polygon(🐢, len, n)
           @svg begin
               for i in len
                   forward(🐢, 100)
                   turn(🐢, 360÷n)
               end
           end
end

function circle(🐢, r)
	@svg begin
		forward(🐢, r)
		polygon(🐢, 20, 18)
	end
end
circle(🐢, 100)
