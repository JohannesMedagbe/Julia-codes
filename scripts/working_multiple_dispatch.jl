"""
set of functions working with methods and multiple dispatch to achieve particular tasks asked for
"""

# Composite type to create or represent a Point with fields x and y related to a dimension

struct Point
	x::Int64
	y::Int64
end

# outer constructor to replace the default and instantiate objects of Point class

function Point(x, y)
	Point.x=x
	Point.y=y
	Point
end

# Create a method operator taking two points and returning a new point with fields made of sum of respective sum of originals

function +(a::Point, b::Point)
           Point(a.x+b.x, a.y+b.y)
end

# Define a method operator taking a point and a tuple and returning a new point made of the sum of the field value and the corresponding (same position) value in tuple

function +(a::Point, b::Tuple)
           Point(a.x+b[begin], a.y+b[begin+1])
end

# Make the previous method operator commutative (can also add tuple values to point field values)

function +(a::Tuple, b::Point)
           b + a
end


"""
Redesign of MyTime type as a number of seconds since midnight and set of corresponding function changes in implementations for methods used in chapter
"""
# Represents time only with number of seconds since midnight
struct MyTime
           seconds_m::Int64
end

# convert general interface to a more specific allowing display and work on hour, minute and second fields
function timetoreal(time::MyTime)
           minutes, second = divrem(time, 60)
           hour, minute = divrem(minutes, 60)
           return (hour, minute, second)
end

# good automatic representation of time even when number of seconds passed
function Base.show(io::IO, time::MyTime)
           @printf(io, "%02d:%02d:%02d", timetoreal(time)...)
end

# alternative printout options representing different dispatches
function printtime(time::MyTime)
           @printf("%02d:%02d:%02d", timetoreal(time)...)
end
function printtime(time)
           println("I don't know how to print the argument time you passed")
end

# Incrementing time by a defined number of seconds
function increment(time::MyTime, seconds::Int64)
           timetoreal(MyTime(time.seconds_m + seconds))
end

# better implementation of increment giving appropriate display as real time
function increment(time::MyTime, seconds::Int64)
           MyTime(time.seconds_m + seconds)
end

# making previous implementation commutative
function increment(seconds::Int64, time::MyTime)
	increment(time, seconds)
end

# check if a time object t1 is after another t2
function isafter(t1::MyTime, t2::MyTime)
           t1.seconds_m>t2.seconds_m
end

# better implementation using < operator overloading to compare directly time instances
import Base.<

function <(t1::MyTime, t2::MyTime)
           <(t1.seconds_m, t2.seconds_m)
end

function isafter(t1::MyTime, t2::MyTime)
           t2<t1
end

# set of functions using flexible inner constructor to create an object of type Mytime and represent it accordingly
mutable struct Mytime
           seconds_m::Int64
           function Mytime(seconds_m::Int64=0)
               @assert(0<=seconds_m, "Seconds after midnight should be equal or greater than 0.")
               time=new()
               time.seconds_m=seconds_m
               time
           end
end
function Base.show(io::IO, time::Mytime)
           @printf(io, "%02d:%02d:%02d", timetoreal(time)...)
end
function timetoreal(time::Mytime)
           minutes, second = divrem(time.seconds_m, 60)
           hour, minute = divrem(minutes, 60)
           return (hour, minute, second)
end

# using + operator overloading for MyTime objects and making use of general programming of sum implementation to sum intuitively a collection of MyTime instances
import Base.+
function +(t1::MyTime, t2::MyTime)
           MyTime(+(t1.seconds_m, t2.seconds_m))
end
function +(t1::Mytime, t2::Mytime)
           Mytime(+(t1.seconds_m, t2.seconds_m))
end
function +(t1::MyTime, t2::Mytime)
           Mytime(+(t1.seconds_m, t2.seconds_m))
end
function +(t1::Mytime, t2::MyTime)
           Mytime(+(t1.seconds_m, t2.seconds_m))
end

sum(collection)

"""
Creating a type Kangaroo
Field: pouchcontents of type Any
Constructor initializes the pouchcontents to an empty array
"""
mutable struct Kangaroo
           pouchcontents::Vector
           function Kangaroo(pouchcontents::Vector=[])
               kangaroo=new()
               kangaroo.pouchcontents=pouchcontents...
               kangaroo
           end
end

# method putinpouch to add an object of any type to pouchcontents field of a Kangaroo object
function putinpouch(a::Kangaroo, b)
	push!(a.pouchcontents, b)
end

# method show to return string representation of Kangaroo object and the contents of pouchcontents
function Base.show(io::IO, a::Kangaroo)
	@prinf(io, "%s", a.pouchcontents)
end


