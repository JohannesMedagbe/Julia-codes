# check if word a is only made of string of allowed characters b

function usesonly(a::String, b::String)
           for i in a
               if i ∉ b
                   return false
               end
           end
           return true
end

# make a combinaison of any random letters from string of letters available

function making(available)
           String(rand(available, 6))
end

# Main

fh=open("words.txt", "r")

container= readlines(fh)

# find occurence of words made of given alphabet "pancrace" in words
while true
               result=making("pancrace")
               if result in words
                       return result
               end
end

# check if it is possible to have a sentence made of combination other than "H

while true
               result1=making("johannes")
               if result1 in words
                   print(result1, " ")
               end
               result2=making("johannes")
               if result2 in words
                       print(result2, " ")
               end
end

# check if it is possible to have a sentence made of combination other than "Heoe alfalfa"

function run(making)
           while true
               result1=making("johannes")
               result2=making("johannes")
               if result1 in words && result2 in words
                       print(result1, " ", result2)
                       return
               end
       end
end

var=run(making)

if length(var)>10 && var != "Hoe alfalfa"
           print(var)
end


# check if a word makes use of the alphabet with at least one occurence of each letter of the alphabet

function usesall(a::String, b::String)
           for i in b
               if i ∉  a
                   return false
               end
           end
           true
end

# count number of words in words.txt that use all letters of vowels allowed called vowels

function count_wvowels(making, usesall, vowels::String)
           count=0
               for i in words
                   if usesall(i, vowels)
                       count+=1
                   end
               end
           return count
end

