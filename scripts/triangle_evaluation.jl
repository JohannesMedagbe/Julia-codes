# checking for possible triangle formation

function istriangle(a::Number, b::Number, c::Number)
	bigger=smaller1=smaller2=0
	if a > b && a > c
		bigger=a; smaller1=b; smaller2=c
	elseif b > a && b > c
		bigger=b; smaller1=a; smaller2=c
	elseif c > a && c > b
		bigger=c; smaller1=a; smaller2=b
	end
	
	if bigger == smaller1 + smaller2
		println("Yes")
	else
		println("No")
	end
end

# checking for possible triangle formation from input

function triangle_eval(istriangle)
	print("Enter first length a:"); a=parse(Int64, readline())
	print("Enter second length b:"); b=parse(Int64, readline())
	print("Enter third length c:"); c=parse(Int64, readline())
	istriangle(a, b, c)
end

triangle_eval(istriangle)
