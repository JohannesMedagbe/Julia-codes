# counting words with at least 20 characters in text file words.txt

fh=open("words.txt", "r")

words=readlines(fh)

for i in words
           if sizeof(i)>=20
               println(i)
           end
end
