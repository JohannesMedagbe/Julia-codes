# compute duration from GMT

x=time()

y=Int64(trunc(x÷3600))

w=Int64(trunc(x%3600))

z=Int64(trunc(w%60))

u=Int64(trunc((x÷3600)÷24))

println("The time is $y hours $w minutes, $z seconds and $u days")

#
