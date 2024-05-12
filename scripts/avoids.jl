# define a valid word by comparing it to a string of characters

function avoids(word::String,forbidden::String)
           for i in word
               if i ∈ forbidden
                   return false
               end
           end
           return true
end

# count number of words not containing forbidden letters

function select_count(words, forbidden)
	number=0
	for i in words
		if avoids(i, forbidden)
			number +=1
		end
	end
	return number
end

# find combination of five forbidden letters excluding smallest number of words

function combi(avoids, select_count)
	retain=""
	count=50000
	while count < 113000
		forbidden=String(rand('a':'z', 5))
		if select_count(words, forbidden) > count
			count=select_count(words, forbidden)
			retain=forbidden
		end
	end
	print(retain, " ", count)
end
		 

# Main

fh=open("words.txt", "r")

words=readlines(fh)

print("Enter string of forbidden letters:")

forbidden=readline()

select_count(words, forbidden)
