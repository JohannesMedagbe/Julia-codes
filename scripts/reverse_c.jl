# reverse complement a strand of valid DNA

function reverse_c(seq::String)
           reverse=seq[end:-1:begin]
           Complement=Dict('A'=>'T', 'T'=>'A', 'C'=>'G', 'G'=>'C', 'a'=>'t', 't'=>'a', 'c'=>'g', 'g'=>'c')
           for i in reverse
               print(Complement[i])
           end
end

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

print("Enter your DNA strand sequence:"); sequence=readline()

if validity_check(sequence)==1
	reverse_c(sequence)
else
	println("Cannot reverse complement that sequence, thank you!")
end
