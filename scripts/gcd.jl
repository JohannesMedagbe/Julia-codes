# compute the great common divisor of two numbers a and b

function gcd(a, b)
	if b==0
		return a
	else
		r=a%b
		return gcd(b, r)
	end
end

