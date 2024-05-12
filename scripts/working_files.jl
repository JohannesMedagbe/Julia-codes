# takes pattern string, replacement string and two filenames and copy contents from first file to second making replacement where appropriate using manip

function sed(a::String, b::String, c::String, d::String, manip)
           fh=open(c, "r")
           reading=readlines(fh)
           close(fh)
           l=false
           try
               f=open(d, "r")
               l=true
           catch exc
               println("The file does not exist")
           end
           if l
               manip(a, b, d, reading)
           else
               run(`touch d`)
               manip(a, b, d, reading)
           end
end

# actual manip pasting in new file after checking and replacement where appropriate

function manip(w::String, x::String, y::String, z::Vector)
           hf=open(y, "a")
           for i in z
               s=split(i, " ")
               for j in s
                   if j==w
                       write(hf, "$x ")
                   else
                       write(hf, "$j ")
                   end
               end
               write(hf, "\n")
           end
           close(hf)
end

module WorkingAnagrams

	export *

	using Main.all_anagrams2

	using JDL2
	
	struct A
		x::String
	end
	
	struct ASerialization
		x::Vector{String}
	end
	
	JLD2.writeas(::Type{A})=ASerialization
	
	JLD2.wconvert(::Type{ASerialization}, a::A)=ASerialization([a.x])
	
	JLD2.rconvert(::Type{A}, a::ASerialization)=A(only(a.x))

	function storeanagrams(a::Vector, all_anagrams2)
		`touch dict_file.jl`
		for (i,j) in all_anagrams2(a)
			y=ASerialization([a.i])
			w=ASerialization([a.j])
			save("dict_file.jl", Dict(y => w))
		end
	end
	
		
	function readanagram(f::String, word::String) 
		z=load(f, sort(collect(word)))
		Z=A(only(a.z))
		return Z
	end

end


#  search recursively for files duplicates in a directory


function file_dupli_search(directory::String, suffix::String)
	lst=[]
	for i in readdir(directory)
		i=joinpath(directory, i)
		if isfile(i)
			if occursin(suffix, i)
				push!(lst, abspath(i))
			end
		else
			file_dupli_search(i, suffix)
		end
	end
	lst
end






