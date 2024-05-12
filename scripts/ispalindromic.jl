# check if x is a palindromic sequence version 2

function ispalindrome(x::String)
	first(x)=x[firstindex(x)]
	last(x)=x[lastindex(x)]
	middle(x)=x[(nextind(x, firstindex(x))):(prevind(x, lastindex(x)))]
	if length(x)!==0
		if first(x)==last(x)
			ispalindrome(middle(x))
		else
			return false
		end
	else
		return true
	end
end


function ispalindrome(x)
	first(x)=x[firstindex(x)]
	last(x)=x[lastindex(x)]
	middle(x)=x[(nextind(x, firstindex(x))):(prevind(x, lastindex(x)))]
	if length(x)==0
		return true
	elseif first(x)!==last(x)
		return false
	elseif length(x)!==0 && first(x)==last(x)
		ispalindrome(middle(x))
	end
end

function check_for_odo_digits(ispalindrome)
           while true
               x=rand(0:9, 6)
               if ispalindrome(x[3:end])
                   println(x)
               else
                   continue
               end
           end
end

check_for_odo_digits(ispalindrome)

