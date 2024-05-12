# some functions written and working on tuples

# to sum different arguments by gathering in tuple

function sumall(args...)
           sum(args)
end


# example of tuple assignment

for (letter, number) in collect(zip(s, t))
           println(number, " ", letter)
end

# create dictionary with tuples as keys and values as numbers

container=Dict(zip(zip("abcde", "zywxu"), 1:5))

for ((first, last), number) in container
           println(first, " ", last, " ", number)
end


# return frequencies of values of string in decreasing order

function mostfrequent(s::String)
           dic=Dict()
           for i in s
               dic[i]=get(dic, i, 0)+1
           end
           d=Dict()
           for y in sort(collect(values(dic)), rev=true)
               for x in keys(dic)
                   if dic[x]==y
                       d[x]=y
                   end
               end
           end
           d
end

module AnagramSets

export all_anagrams2
# finding all anagrams by using previous isanagram function and outputting them in a given format

function all_anagrams1(a::Vector, isanagram)
                  dic=Dict()
                  for i=1:length(a)
                      for j=2:length(a)
                       if length(a[i])!=length(a[j])
                           continue
                       else
                          if isanagram(a[i], a[j]) && a[i]!=a[j]
                              get!(dic, a[i], [a[j]])
                              if a[i] in keys(dic) && a[j] ∉ dic[a[i]]
                                  push!(dic[a[i]], a[j])
                              end
                          end
                       end
                      end
                  end
                  for (x, y) in dic
                      println([x, y...])
                  end
end

function isanagram(x::String, y::String)
                  collect1=sort(collect(x))
                  collect2=sort(collect(y))
                  if collect1==collect2
                      return true
                  else
                      return false
                  end
end

# other version of previous function

function all_anagrams2(a::Vector)
           dic=Dict()
           for i in a
               for j in a
                   if !(length(i)==length(j))
                       continue
                   else
                       if i!=j && sort(collect(i))==sort(collect(j))
                           get!(dic, sort(collect(i)), [i, j])
                           if sort(collect(i)) in keys(dic) && i ∉ dic[sort(collect(i))] && j ∉ dic[sort(collect(i))]
                               append!(dic[sort(collect(i))], [i, j])
                           end
                       end
                   end
               end
           end
           for (x, y) in dic
               println(y)
           end
           dic
 end

# find all anagrams and print the longest array first, then the next, etc.

function ls_anagrams(a::Vector)
                  dic=Dict()
           	  for i in a
               		for j in a
                   		if !(length(i)==length(j))
                       			continue
                   		else
                       			if i!=j && sort(collect(i))==sort(collect(j))
                           			get!(dic, sort(collect(i)), [i, j])
                           			if sort(collect(i)) in keys(dic) && i ∉ dic[sort(collect(i))] && j ∉ dic[sort(collect(i))]
                               				append!(dic[sort(collect(i))], [i, j])
                           			end
                       			end
                   		end
               		end
           	  end
                  array=[]
                  for (x, y) in dic
                    push!(array, length(y))
                  end
                  sort!(array, rev=true)
                  d=[]
                  for z in array
                   for (x, y) in dic
                       if length(y)==z
                           push!(d, y)
                       end
                   end
                  end
                  d
end

end

# retrieve the most probable collection of anagrams of length e

function mostprobable_rack_8(a::Vector, ls_anagrams, e)
                  d=ls_anagrams(a)
                  for l in d
                   if length(l[1])==e
                       return l
                   end
                  end 
end


# find all metathesis pairs in an array of words a

function all_metathesis_pair(a::Vector)
           d=Dict()
           for i=1:length(a)
               for j=1:length(a)
                   if metathesis_pair(a[i], a[j]) && a[i] ∉  keys(d) && a[i] ∉  values(d)
                       d[a[i]]=a[j]
                   end
               end
           end
           for (x, y) in d
               println((x, y))
           end
end

# check if two words form a metathesis pair

function metathesis_pair(x::String, y::String)
           if length(x)==length(y) && x!=y && sort(collect(x))==sort(collect(y))
               for i=1:length(x)
                   for j=1:length(x)
                       nx=x[begin:i-1]*x[j]*x[i+1:j-1]*x[i]*x[j+1:end]
                       if nx==y
                           return true
                       end
                   end
               end
           end
           false
end

# find longest reducible word in English

function find_longest_reducible(a::Vector, recursively_reducible)
           final=[]
           for i in a
               if recursively_reducible(i, a, children)
                   push!(final, i)
               end
           end
           maximum(final)
end

# check for reversibly reducibility

function recursively_reducible(w::String, a::Vector, children)
           known=Dict()
           if length(w)==0
               return true
           elseif length(w)==1
               if w in a
                   return true
               else
                   return false
               end
           else
               if w in keys(known)
                   return known[w]
               else
                   if length(children(a, w))!=0
                       for i in children(a, w)
                           recursively_reducible(i, a, children)
                           known[i]=true
                           return known[i]
                       end
                   else
                       return false
                   end
               end
           end
end

# find children of word w

function children(a::Vector, w::String)
           array=[]
           for i=1:length(w)
               u=w[begin:i-1]*w[i+1:end]
               if u in a
                   push!(array, u)
               end
           end
           array
end

