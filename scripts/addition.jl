function addition(n1::Number, n2::Number)
           return n1+n2
       end

println(addition(parse(Float64, readline()), parse(Float64, readline())))

function addition_of_addition(n1::Number, n2::Number)
	return addition(n2, n1) + addition(n1, n2)
end

println(addition_of_addition(78.89, 89234))
	
