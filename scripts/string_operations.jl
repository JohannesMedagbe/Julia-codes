# various codes for operating on strings

# display string characters forward one at a time on newline each time

function display_for(s::String)
           index = firstindex(s)
           while index <= sizeof(s)
              println(s[index])
              index=nextind(s, index)
           end
end

# display string characters backward one at a time on newline each time

function display_back(s::String)
           index = lastindex(s)
           while index >= 1
               println(s[index])
               index=prevind(s, index)
           end
end

# search letter and return their index

function find(word, letter)
           index=firstindex(word)
           while index <= sizeof(word)
               if word[index]==letter
                   print(index, " ")
               end
               index=nextind(word, index)
           end
           -1
end

# search letter an return their index starting from a specified position

function find(word, letter, start)
	index=nextind(word, start)
	while index <= sizeof(word)
		if word[index]==letter
		print(index, " ")
		end
		index=nextind(word, index)
	end
	print(-1)
end

# count occurences of a character in a string

function count(word, letter, start)
           counter=0
           x=start
           while x <= lastindex(word)
               if word[x]==letter
                   counter+=1
               end
               x+=1
           end
           println(counter)
end
 

# search as findfirst built-in function

function find(word::String, letter::String, start::Int64)
           index=nextind(word, start)
           letter_f=sizeof(letter)
           while index <= sizeof(word)
               if word[index:letter_f]==letter
                   return index:letter_f
               elseif index==sizeof(word)
                   break
               elseif letter_f==sizeof(word)
                   break
               elseif !(index==lastindex(word))
                   index=nextind(word, index)
                   letter_f +=1
               end
           end
           return -1
end


# check if two words are in reverse order of each

function isreverse(word1, word2)
           if !(sizeof(word1)==sizeof(word2))
               return false
           end
           i=firstindex(word1)
           j=lastindex(word2)
           while j>=0
               if !(word1[i]==word2[j])
                   return false
               elseif i==sizeof(word1)
                   break
               end
               j=prevind(word2, j)
               i=nextind(word1, i)
           end
           true
end





