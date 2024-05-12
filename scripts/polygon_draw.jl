# draw a polygon passing 3 arguments

using ThinkJulia

🐢 = Turtle()

len=[1,2,3,4]

n=6

function polygon(🐢, len, n)
           @svg begin
               for i in len
                   forward(🐢, 100)
                   turn(🐢, 360÷n)
               end
           end
end

polygon(🐢, len, n)


