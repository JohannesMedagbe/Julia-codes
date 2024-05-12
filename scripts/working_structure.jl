# scrutinize a file, break each line into words and return them one by one replacing uppercase by lowercase

function file_line_words()
           print("Enter filename:");filename=readline()
           fh=open(filename, "r")
           read=readlines(fh)
           close(fh)
           array1=[]
           for i in read
               splitted=split(i, [' ', ':', '.'])
               for j in splitted
                   array2=[]
                   for k in j
                       if isletter(k)
                           push!(array2, lowercase(k))
                       else
                           push!(array2, k)
                       end
                   end
                   push!(array1, join(array2))
               end
           end
           for x in array1
               println(x)
           end
end

# scrutinize a plain text file, remove headers, break each line into words and return them one by one replacing uppercase by lowercase

function file_line_words_modified()
                  print("Enter filename:");filename=readline()
                  fh=open(filename, "r")
                  read=readlines(fh)
                  close(fh)
                  array1=[]
                  for i in read
                      if '>' in i
                          continue
                      else
                          splitted=split(i, ['/', ';', ':', '.'])
                          for j in splitted
                              array2=[]
                              for k in j
                                  if isletter(k)
                                      push!(array2, lowercase(k))
                                  else
                                      push!(array2, k)
                                  end
                              end
                              push!(array1, join(array2))
                          end
                      end
                  end
                  for x in array1
                      println(x)
                  end
end

# reduced version of file_line_words for development and rewriting of num_words_freq

function file_line_words_modified2()
                  print("Enter filename:");filename=readline()
                  fh=open(filename, "r")
                  read=readlines(fh)
                  close(fh)
                  array1=[]
                  for i in read
                      if '>' in i
                          continue
                      else
                          splitted=split(i, ['/', ';', ':', '.'])
                          for j in splitted
                              array2=[]
                              for k in j
                                  if isletter(k)
                                      push!(array2, lowercase(k))
                                  else
                                      push!(array2, k)
                                  end
                              end
                              push!(array1, join(array2))
                          end
                      end
                  end
                  array1
end

# give the number of words in a plain text file with name entered from keyboard and the frequency of each word

function num_words_freq(file_line_words_modified2)
           f=file_line_words_modified2()
           println("The number of words in this book is:", length(f))
           d=Dict()
           for i in f
               d[i]=get!(d, i, 0)+1
           end
           for (i,j) in d
               println("The word $i appears $j times")
           end
end

# return the number of different words used in file with name entered from keyboard

function diff_words(file_line_words_modified2)
           f=file_line_words_modified2()
           d=Dict()
           for i in f
               d[i]=get!(d, i, 0)+1
           end
           println("The number of different words used in this book is:", length(keys(d)))
end

# Compare the vocabulary richness of two plain text files whose names are entered from keyboard

function comp_diff_words(diff_words, file_line_words_modified2)
           diff_words(file_line_words_modified2)
           diff_words(file_line_words_modified2)
end

# modified version of num_words_freq

function num_words_freq_modified(file_line_words_modified2)
                  f=file_line_words_modified2()
                  d=Dict()
                  for i in f
                      d[i]=get!(d, i, 0)+1
                  end
                  d
end
       
# extract the 20 most frequent words from file entered using modified version of num_words_freq and file_line_words

function most_freq_20_words(num_words_freq_modified, file_line_words_modified2)
           f= num_words_freq_modified(file_line_words_modified2)
           collection=sort(collect(values(f)), rev=true)[1:20]
           array=[]
           for (x, y) in f
               if y in collection
                   push!(array, y)
               end
           end
           for i in array
               println(i)
           end
end

# extract words in file specified by user input that do not figure in a words list file 

function diff_words_list(file, file_line_words_modified2)
           w=open(file, "r")
           words_list=readlines(w)
           close(w)
           f=file_line_words_modified2()
           for i in f
               if i ∉  words_list
                   println(i)
               end
           end
end

# There are better versions of all these functions in the ThinkJulia textbook which do the job more appropriately. Here they are:

# for file processing

function processfile(processline, filename)
           hist=Dict()
           for line in eachline(filename)
               processline(line, hist)
           end
           hist
end

# for line processing and in respect of file processing

function processline(line, hist)
           line=replace(line, '-'=> ' ')
           for word in split(line)
               word=string(filter(isletter, [word...])...)
               word=lowercase(word)
               hist[word]=get!(hist, word, 0)+1
           end
end

# for extraction of differing words in two books or collections of words

function substract(d1, d2)
           res=Dict()
           for key in keys(d1)
               if key ∉ keys(d2)
                   res[key]=nothing
               end
           end
           res
end

# for extracting common words

function mostcommon(hist)
           t=[]
           for (key, value) in hist
               push!(t, (value, key))
           end
           sort(t, rev=true)
end

# for printing the first n common words passing n as an optional parameter

function print_most_common(hist, num=2)
           t=mostcommon(hist)
           println("The most common words are:")
           for (freq, word) in t[1:num]
               println(word, "\t", freq)
           end
end


# same stuffs but using sets

function processline(line, hist)
           line=replace(line, '-'=> ' ')
           for word in split(line)
               word=string(filter(isletter, [word...])...)
               word=lowercase(word)
               push!(hist, word)
           end
end


function processfile(processline, filename)
           hist=Set()
           for line in eachline(filename)
               processline(line, hist)
           end
           hist
end

function substract(d1, d2)
           res=Set()
           for i in d1
               if i ∉  d2
                   push!(res, i)
               end
           end
           res
end

# find most probable completion terms using markov analysis 

function most_probable_following(filename, n)
            d=Dict()
            for line in eachline(filename)
            	words=split(line)
            	for i in 1:length(words)
               		if i<length(words)
                   		get!(d, words[i:i+n-1], [])
               		elseif i>=length(words)
                   		break
               		end
            	end   
            	for i in 1:length(words)
               		for j in 1:length(words)
                   		if j-(i+n-1)==1
                       			push!(d[words[i:i+n-1]], words[j])
                   		elseif i==length(words) || j==length(words)-1
                       			break
                   		end
               		end
            	end
	     end
	     d
end

# more general implementation of most_probable_following combining two files vocabularies

function most_probable_following_broad(filename1, filename2, n)
	d=Dict()
	most_probable_following(filename1, n)
	most_probable_following(filename2, n)
	d
end

# core most_probable_following modified 

function most_probable_following(filename, n)
            for line in eachline(filename)
            	words=split(line)
            	for i in 1:length(words)
               		if i<length(words)
                   		get!(d, words[i:i+n-1], [])
               		elseif i>=length(words)
                   		break
               		end
            	end   
            	for i in 1:length(words)
               		for j in 1:length(words)
                   		if j-(i+n-1)==1
                       			push!(d[words[i:i+n-1]], words[j])
                   		elseif i==length(words) || j==length(words)-1
                       			break
                   		end
               		end
            	end
	     end
	     d
end

# use markov analysis to predict and complete followiing terms

function prediction_markov(filename, most_probable_following, n) # can modify to make take more files also
           d=most_probable_following(filename, n)
           print("Enter the prefix:"); x=split(readline()); a, b=x
           if x in keys(d)
               a, b, d[x][1]
           end
end

# generate random sentence using prediction based on markov analysis

function random_sentence(filename, most_probable_following, prediction_markov, n, m) # can modify to make take more files also
	a=[]
	while length(a)<=m
		append!(a, [prediction_markov(filename, most_probable_following, n)])
	end
	for i in a
		for j in i
			print(" ", j)
		end
	end
	print(".")
end

# check linear relationship between log(frequency) and log(rank) by plotting, need to module Plots

function freq_rank(a::Vector)
           freq=Dict()
           for i in a
               freq[i]+=1
           end
           array=[]
           for z in sort(collect(values(freq)), rev=true)
               for (x,y) in freq
                   if z==y
                       push!(array, j)
                   end
               end
           end
           frequency=collect(values(freq))
           rank=collect(1:length(array))
           if length(frequency)==length(rank)
               for a in frequency
                   for b in rank
                       plot(log(a), log(b))
                   end
               end
           end
end

# process fasta file and give number of sequences with numseq_fasta, each sequence name and its length with seq_info_fasta

function numseq_fasta(s)
           num_sequence=count('>', s)
end

function seq_info_fasta(a::Vector)
                  d=Dict()
                  for i in 1:length(a)
                      if a[i][1]=='>'
                          get!(d, a[i][2:end], length(a[i+1]))
                      end
                  end
                  print(d)
end
		
