# transcribe DNA to RNA

function transcriber(seq::String)
	seqf=[]
	for i in seq
		if i=='T'
			push!(seqf,'U')
		else
			push!(seqf,i)
		end
	end
	for i in seqf
		print(i)
	end
end

seq=readline()

transcriber(seq)


