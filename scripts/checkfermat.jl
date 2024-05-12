# function to check Fermat law a^n + b^n = c^n

function checkfermat(a, b, c, n)
	if n>2 && a^n + b^n == c^n
		println("Holy smokes, Fermat was wrong")
	else
		println("No, that doesn't work")
	end
end


# function to check Fermat law from keyboard input

function checkfermat_input(checkfermat)
	print('a');a=parse(Int64, readline())
	print('b');b=parse(Int64, readline())
	print('c');c=parse(Int64, readline())
	print('n');n=parse(Int64, readline())
	checkfermat(a, b, c, n)
end

