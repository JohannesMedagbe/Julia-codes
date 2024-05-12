# check if a number is a power of another number

function ispower(a, b)
           if a==1
               return true
           else
               return a%b==0 && ispower(a/b, b)
           end
end

