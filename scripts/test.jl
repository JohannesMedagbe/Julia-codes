"""

The function find(word::String, letter::String, start::Int64) looks for a particular string on a bigger one.

"""
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

