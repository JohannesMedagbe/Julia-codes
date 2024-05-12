# couple of functions to process fastq file and see what it contains

# get number of reads is in fastq file

function number_reads(file)
	count=0
	for i in eachline(file)
		count+=1
	end
	return count÷2
end



# get reads name

function reads_name(file)
	lines=""
	open(file) do io
		lines=string(readlines(io));
	end
	
	if occursin(">", lines)
		pos=findnext(">", lines, 0)
		while true
			if pos <=sizeof(lines)
				print(lines[pos+1:pos+14], ", ")
			elseif pos==sizeof(lines)
				break
			else
				break
			end
			pos=findnext(">", lines, pos)
		end
	end
end


# another function for extracting reads name

function classify(f, i, s)
           start=1
           index=findfirst("\n", data)
           while true
               print(data[start:index-1])
               print("Decide where to go:")
               decision=readline()
               if decision == 1
                   write(i,data[start:index-1])
               elseif decision == 2
                   write(s, data[start:index-1])
               elseif index==lastindex(data)
                   break
               end
               start=index
               index=findnext("\n", data, index)
           end
       end

print("Enter the name of your fastq file:")

f=readline()

num=number_reads(f)

println("The number of reads in the fastq file is:", num)

println("The reads names are:")

reads_name(f)
