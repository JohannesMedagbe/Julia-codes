# calculate the GC content of a sequence of DNA

# check the validity of provided sequence

function validity_check(seq::String)
	result=0
	for i in seq
		if !(i in "ACTGactg")
			println("Illegal sequence, analysis cannot be done")
			result=0
			break
		else
			result=1
		end
	end
	return result
end

# GC content calculator

function gc_content(seq::String)
	gc_count=0
	for i in seq
		if i in "gcGC"
			gc_count+=1
		end
	end
	gc_content=gc_count*100/length(seq)
	gc_content= string(gc_content)
	println("The GC content of the sequence is:"*gc_content, "%")
end


print("Enter your sequence:")
seq=readline()

validity_result=validity_check(seq)

if validity_result==1
	gc_content(seq)
else
	println("GC content cannot be calculated")
end
