# count the number of occurences of a character in a string s of characters

function frequencies(s)
           d=Dict()
           for c in s
               d[c]=get(d, c, 0)+1
           end
           d
end

# choose random key in frequencies dictionary and return it with its value in a given format

function choosefromhist(frequencies, s)
           d=frequencies(s)
           total=sum(collect(values(d)))
           for (i,j) in d
               if i==rand(keys(d))
                   return "$i has a frequency of $j/$total"
               end
           end
end

# another implementation of previous offering valid case at each computation: choosefromhist_modified

function inbisect_modified(array, value) # modified version of inbisect
                          x=length(array)÷2
                          if array[x]==value
                              return x
                          elseif array[x]!=value && x==1
                              if length(array)%2==0
                                   if array[x+1]==value
                                       return x+1
                                   else
                                      if array[x+1]>value && array[x]<value
                                           return x+1
                                      else
                                           return x+2
                                      end 
                                   end
                              else
                                  if array[x+1]==value
                                      return x+1
                                  elseif array[x+2]==value
                                      return x+2
                                  else
                                       if array[x+1]>value && array[x]<value
                                           return x+1
                                       elseif array[x+2]>value && array[x+1]<value
                                           return x+2
                                       else
                                           return x+3
                                       end
                                  end
                              end
                          elseif array[x]!=value && x!=1
                                     if array[x]>value
                                         inbisect_modified(array[begin:x-1], value)
                                     else
                                         inbisect_modified(array[x+1:end], value)
                                     end
                          end
end

function cumulsum(a::Vector) # previous cumulsum implementation
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

function frequencies(s) # use of previous implementation of frequencies
                  d=Dict()
                  for c in s
                      d[c]=get(d, c, 0)+1
                  end
                  d
end

function choosefromhist_modified(frequencies, s) # actual new implementation of choosefromhist
                  d=frequencies(s)
                  total=sum(collect(values(d)))
                  a=collect(keys(d))
                  b=[]
                  for i in a
                      push!(b, d[i])
                  end
                  c=cumulsum(b)
                  random=rand(1:c[end])
                  pos=inbisect_modified(c, random)
                  randomword=a[pos]
                  for (key, value) in d
                      if key==randomword
                           return "$key has a frequency of $value/$total"
                      end
                  end
end



#  print keys with their value

function printhist(h)
           for c in keys(h)
               println(c, " ", h[c])
           end
end

# print keys in order with their value

function printhist(h)
           for c in sort(collect(keys(h)))
               println(c, " ", h[c])
           end
end

# search a key having a particular value

function reverse_lookup(d, v)
           for k in keys(d)
               if d[k]==v
                   print(k, " ")
               end
           end
           error("Lookup error, no key with this value")
end

#

function invertdic(d)
           inverse=Dict()
           for key in keys(d)
               get!(inverse, d[key], [key])
               if d[key] ∈ keys(inverse) && key ∉ inverse[d[key]] push!(inverse[d[key]], key)end
           end
           inverse
end

# ackermann implementations

function ack_1(m, n)
           if m==0
               return n+1
           elseif m>0 && n==0
               return ack(m-1, 1)
           elseif m>0 && n>0
               return ack(m-1, ack(m, n-1))
           end
end

function ack_2(m, n)
           if m ∈ keys(known)
               return known[m]
           elseif n==0 && m>0
               return ack(m-1, 1)
           end
           res=ack(m-1, ack(m, n-1))
end

# another version of hasduplicates

function hasduplicates3(a::Vector)
           for i in a
               dict[i]=get(dict, a, 1)+1
           end
           if maximum(values(dict))>1
               return true
           else
               return false
           end
end

# initial implementation of rotateword or cipher

function rotateword(word::String, num::Int64)
           r=""
           for i in word
               r=r*string(Char(Int(i)+num))
           end
           r
end

# find all rotatewords by x in an array of words a

function rotatepairs(a::Vector, rotateword, x)
           array=[]
           for i in words
               if rotateword(i, x) in words
                   append!(array,[i, rotateword(i, x)])
               end
           end
           array
end

# transform array into dictionary for easy reading

function create_dic(a::Vector)
           dic=Dict()
           for i in a
               dic[i]=1
           end
           dic
end

       

# fast check or search using dictionary 

function fastcheck_dic(a::Vector, create_dic, word)
           if word in keys(create_dic(a))
               return true
           end
           false
end

# find theoretical homophones of words i

function find_homo(words, fastcheck_dic)
           array=[]
           for i in words
               if length(i)==5 && fastcheck_dic(words, create_dic, i[2:end]) && fastcheck_dic(words, create_dic, i[1]*i[3:end])
                   append!(array, [i, i[2:end], i[1]*i[3:end]])
               end
           end
           array
end

# find valid words potentially homophones after modification and check if they are actual homophones , need first a dictionary of homophones with key the word and value the pronunciation

function check_homo(dictionary, find_homo)
	array=[]
	f=find_homo(words, fastcheck_dic)
	for i=1:length(f)
		if dictionary[f[i+1]]==dictionary[f[i]] && dictionary[f[i+2]]==dictionary[f[i]]
			append!(array, [f[i], f[i+1], f[i+2]])
		end
		i+=3
	end
	array
end






