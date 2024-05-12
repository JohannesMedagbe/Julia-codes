# draw a square with a Turtle

using ThinkJulia

t=Turtle()
function square(t)
          @svg begin
               for i in 1:4
                   forward(t, 100)
                   turn(t, -90)
               end
           end
end


square(t)
