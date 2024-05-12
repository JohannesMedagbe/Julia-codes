# return word a only if it contains double letter repeating successively three times 

function find_three_double(a::String)
           for i=1:sizeof(a)
               if a[i]==a[i+1] && a[i+2]==a[i+3] && a[i+4]==a[i+5]
                   return a
               elseif i==sizeof(a)-5
                   break
               else
                   continue
               end
           end
           return "it is not"
end

# Main

fh=open("words.txt", "r")

words=fh(readlines)

for i in words
           if sizeof(i)<6
               continue
           elseif check_three_double(i)
               println(i)
           end
end


# check if two words are reverse of one another

function isreverse(x, y)
           reverse(x)==y
end

collection=collect(0:99)

# find all ages of son made of reverse age mother occuring simultaneously with time knowing that son is aged 37 when mom is 73

for i in collection
           for j in collection
               if j==i+36 && isreverse(string(i),string(j))
                   println(i)
               end
           end
end
