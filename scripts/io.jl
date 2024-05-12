# read, write and append to different files

fh=open("gc_content.jl", "r") do i
           readlines(i)
       end


for i in fh
           open("written.jl", "w") do n
               write(n, i)
           end
end


for i in fh
           open("written.jl", "a") do n
               write(n, i)
           end
end


for i in fh
           open("written.jl", "a") do n
               write(n, i, "\n")
           end
end

