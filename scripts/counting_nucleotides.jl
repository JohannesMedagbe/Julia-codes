# counting number of given nucleotides in a sequence and displaying with space separation

function nucleotide_count(seq::String)
	A=C=T=G=0
	for i in seq
		if i=='A'
			A+=1
		elseif i=='T'
			T+=1
		elseif i=='G'
			G+=1
		elseif i=='C'
			C+=1
		end
	end
	println(A," ",C," ",G," ",T)
end
nucleotide_count(readline())
