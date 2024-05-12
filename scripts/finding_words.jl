# find words without e in a list of words

fh=open("words.txt", "r")

words=readlines(fh)

function hasno_e(words)
           for i in words
               if 'e' ∉  i
                   println(i)
               end
           end
end

