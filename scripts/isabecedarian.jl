# tell if a word is abecedarian or if its letters appear in alphabetical order

function isabecedarian(a::String)
           for i=1:length(a)
               if i>=length(a)
                   break
               elseif a[i+1]>=a[i]
                   continue
               else
                   return false
               end
           end
           true
end

# count number of abecedarian words in words.txt

function count_abecedarian(isabecedarian)
           count=0
           for i in words
               if isabecedarian(i)
                   count+=1
               end
           end
           return count
end

