# adds up all integers in nested arrays made of integers

function nestedsum(a)
           x=0
           for i in a
              x+=sum(i)
           end
           x
end

# returns a new array of increasing cumulative sum of the original

function cumulsum(a::Vector)
           res=[]
           for i=1:length(a)
               if i==1
                   push!(res, a[i])
               elseif i>length(a)
                   break
               else
                   x=res[i-1]+a[i]
                   push!(res, x)
               end
           end
           res
end

# returns all elements of an array in a new array but first and last

function interior(a::Vector)
           res=[]
           for i=1:length(a)
               if 1<i<length(a)
                   push!(res,i)
               elseif i>length(a)
                   break
               end
           end
           res
end

function interior(a::Vector)
           a[begin+1:end-1]
       end

# modify an array by removing first and last elements while returning nothing at call of function

function interior!(a::Vector)
           popfirst!(a)
           pop!(a)
           return
end

# check if an array is sorted in ascending order or not

function issorted(array::Vector)
           if sort(array)==array
               return true
           else
               return false
           end
end

# check if one word is an anagram of the other by collecting elements in array format, sorting and comparing

function isanagram(x::String, y::String)
           collect1=sort(collect(x))
           collect2=sort(collect(y))
           if collect1==collect2
               return true
           else
               return false
           end
end

# check if an array has duplicates by sorting then comparing consecutive elements

function hasduplicates(a::Vector)
           s=sort(a)
           for i=1:length(s)
               if i>=length(s)
                   break
               elseif s[i]==s[i+1]
                   return true
               end
           end
           false
end

# compute the probability of two elements being identical in random array of birthdays of size 23 

function birthday_p(rand)
           x=p=0
           while true
               s=sort(rand(1:365, 23))
               @show s
               for i=1:length(s)
                   if i>=length(s)
                       break
                   elseif s[i]==s[i+1]
                       x+=1
                   else
                       continue
                   end
               end
               p=x/length(s)
               if p != 0
                   break
               end
           end
           p
end

function birthday_p(rand)
           x=p=0
           while true
               s=sort(rand(1:365, 23))
               @show s
               for i=1:length(s)
                   if i>=length(s)
                       break
                   elseif s[i]==s[i+1]
                       x+=1
                   else
                       continue
                   end
               end
               pi=x/length(s)
               if pi != 0 && pi==p
                   break
               end
               p=pi
           end
           p
end

# two functions appending each word in words to an array t but with different runningtime
# faster because push directly without having to access and reassign from memory the array t first each time
t=[]
function f1(words)
           for i in words
               push!(t, i)
           end
end


# much much slower because reassign and addding in memory each time 
function f2(words)
           t=[]
           for i in words
               t=[t..., i]
           end
end

# search binarily a value along an array

function inbisect(array, value)
               if sort(array)==array
                   x=length(array)÷2
                   if array[x]==value
                       return true
                   elseif array[x]!=value && x==1
                       if length(array)%2==0
                           if array[x+1]==value
                               return true
                           else
                               return false
                           end
                       else
                           if array[x+1]==value
                               return true
                           elseif array[x+2]==value
                               return true
                           else
                               return false
                           end
                       end
                   elseif array[x]!=value && x!=1
                              if array[x]>value
                                  inbisect(array[begin:x-1], value)
                              else
                                  inbisect(array[x+1:end], value)
                              end
                          end
                      else
                          return "Cannot apply binary search. Array not in order"
                      end
end

# find all reverse pairs in word array w

function reversepairs(w)
           res=[]
           for i=1:length(w)
               for j=2:length(w)
                   if w[i]==reverse(w[j]) && w[j]==reverse(w[i])
                       append!(res, [w[i], w[j]])
                   end
               end
           end
           res
end

# better version of previous function

function reversepairs(w)
           res=[]
           for i=1:length(w)
               if reverse(w[i]) ∈  w
                   append!(res, [w[i], reverse(w[i])])
               end
           end
           res
end

# interlock alternating letters of w1 and w2

function interlock(w1, w2)
           collect1=collect(w1)
           collect2=collect(w2)
           collect3=[]
           i=1
           while i<= max(length(collect1), length(collect2))
               if i > length(collect1) || i > length(collect2)
                   break
               else
                   append!(collect3, [collect1[i], collect2[i]])
                   i+=1
               end
           end
           s=join(collect3)
end

# retrieve positions of words that can be interlocked

function find_interlock(w)
           pos=[]
           for i=1:length(w)
               for j=2:length(w)
                   if interlock(w[i], w[j]) ∈  w
                       append!(pos, [i, j])
                   end
               end
           end
           pos
end

