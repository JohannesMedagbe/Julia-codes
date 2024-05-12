module basics_operations
	export addition, substraction, multiplication, division, validity_check, gc_content

# add two numbers

	function addition(n1::Number, n2::Number)
		return n1+n2
	end

# sum after two respective addition

	function addition_of_addition(n1::Number, n2::Number)
		return addition(n2, n1) + addition(n1, n2)
	end

# substract one number from the other

	function substraction(n1::Number, n2::Number)
		return n1-n2
	end

# multiply two numbers

	function multiplication(n1::Number, n2::Number)
		return n1*n2
	end

# divide two numbers

	function division(n1, n2)
		return n1/n2
	end

# Check the validity of the input sequence

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
		println("The GC content of the sequence is:"*gc_content)
	end
	
end # module end


