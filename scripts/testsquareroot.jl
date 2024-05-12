# print table containing for each line results from sqrt, mysqrt and diff

function sqrt(a)
           array1=[]
           x=a/2
           while true
               y=(x+a/x)/2
               push!(array1, [x, y])
               if abs(y-x)<0.001
                   break
               end
               x=y
           end
           return array1
end
           

function mysqrt(a)
          array2=[]
          x=a
           while true
               y=(x+a/x)/2
               push!(array2, [x, y])
               if abs(y-x)< 0.001
                   break
               end
               x=y
           end
           return array2
end



function diff(a, sqrt, mysqrt)
           o=[]
           m=sqrt(a)
           n=sqrt(a)
           for i in 1:length(m)
               for j in 1:length(n)
                   if i==j
                       d=abs(m[i][end]-n[j][end])
                       push!(o, [m[i][begin], m[i][end], n[j][end], d])
                   end
               end
           end
           println(o)
end



function testsquareroot(a, sqrt, mysqrt, diff)
           diff(a, sqrt, mysqrt)
end

a=1000

testsquareroot(a, sqrt, mysqrt, diff)

