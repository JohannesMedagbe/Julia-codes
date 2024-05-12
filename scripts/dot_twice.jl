#print something
function print_s(s)
	println(s)
end

#print something twice
function print_twice(bruce)
	println(bruce)
	println(bruce)
end

#call something twice
function dotwice(f, a)
	f(a)
	f(a)
end

dotwice(print_s, "spam")

#call something four times
function dofour(f, a)
	f(a)
	f(a)
end

dofour(print_twice, "spam")

