# structs and functions applications

# create a struct representing time different from built-in time type
# fields: hour, minute, second
struct MyTime
	hour
	minute
	second
end

# print an instance of MyTime provided in a given format after importing Printf
function printtime(time)
	@printf "%02d:%02d:%02d" time.hour time.minute time.second
end

# compare two MyTime instances t1 and t2 and determines if t1 comes after t2
function isafter(t1, t2)
           if t2.hour < t1.hour
               return true
           elseif t2.hour == t1.hour
               if t2.minute < t1.minute
                   return true
               elseif t2.minute > t1.minute
                   return false
               elseif t2.minute == t1.minute
                   if t2.second < t1.second
                       return true
                   else
                       return false
                   end
               end
           else
           end
           false
end

# improved version of isafter
function isafter(t1, t2) 
	t2.hour*360+t2.minute*60+t2.second < t1.hour*360+t1.minute*60+t1.second
end

# improved version of originally implemented version of increment! modifier in ThinkJulia book using no loops for updating respective fields based on second increment
function increment!(time, seconds)
           time.second += seconds
           quotient1=time.second÷60
           remainder1=time.second%60
           if quotient1 >= 1
               time.second = remainder1
               time.minute += quotient1
           end
           quotient2=time.minute÷60
           remainder2=time.minute%60
           if quotient2 >= 1
               time.minute = remainder2
               time.hour += quotient2
           end
end

# pure function version of implement preserving fields values of original time

function increment(time, seconds)
           new_second = time.second + seconds
           new_minute=time.minute
           new_hour=time.hour
           quotient1=new_second÷60
           remainder1=new_second%60
           if quotient1 >= 1
               new_second = remainder1
               new_minute = time.minute + quotient1
           end
           quotient2=new_minute÷60
           remainder2=new_minute%60
           if quotient2 >= 1
               new_minute = remainder2
               new_hour = time.hour + quotient2
           end
           MyTime(new_hour, new_minute, new_second)
end

# better version of increment! using conversion to integer and backconversion to simplify update
function increment!(time, seconds)
                  inttotime(timetoint(time)+seconds)
end

# takes a time and a number and return an object of the their product using timetoint and intotime implicitly
function multime(time, number)
           inttotime(timetoint(time)*number)
end

"""
Gives the average pace of a run in time per mile
Input: multime, end time of race starting at 0s and distance run on
Output: MyTime object representing the average pace
"""
function average_pace(multime, time, distance)
           multime(time, 1/distance)
end

"""
Computes age, and periods to next birthday using date of birth as input
"""
function age_detailsnextbirthday(date)
                  birthday = Date(date, "y-m-d")
                  age = Dates.year(now(UTC)) - Dates.year(birthday)
                  println("The user's age is: ", age, " years.")
                  nextbirthday = Dates.Year(birthday) + Dates.Month(birthday) + Dates.Day(birthday) + Dates.Year(age) + Dates.Year(1)
                  println("The next birthday is in: ", nextbirthday - Dates.Year(Date(now(UTC))) - Dates.Month(Date(now(UTC))) - Dates.Day(Date(now(UTC))))
end

"""
Improved version of age_detailsnextbirthday which computes age, number of days, hours, minutes, seconds to next birthday using date of birth as input
"""
function age_detailsnextbirthday(date)
                  birthday = Date(date, "y-m-d")
                  age = Dates.year(now(UTC)) - Dates.year(birthday)
                  println("The user's age is: ", age, " years.")
                  nextbirthday = Dates.Year(birthday) + Dates.Month(birthday) + Dates.Day(birthday) + Dates.Year(age) + Dates.Year(1)
                  result=Dates.periods(nextbirthday - Dates.Year(Date(now(UTC))) - Dates.Month(Date(now(UTC))) - Dates.Day(Date(now(UTC))))
                  @show result
                  if length(result)==1
                       final=Dates.value(result[1])*365
                  elseif length(result)==2
                       final=Dates.value(result[1])*365 + Dates.value(result[2])*12
                  else
                       final=Dates.value(result[1])*365 + Dates.value(result[2])*12 + Dates.value(result[3])
                  end
                  println("The next birthday is in ", final, " days.")
                  println("The next birthday is in ", Base.ceil(Day(final), Hour), ".")
                  println("The next birthday is in ", Base.ceil(Day(final), Minute), ".")
                  println("The next birthday is in ", Base.ceil(Day(final), Second), ".")
end

# find the number of days and the date where one is twice older than other
function double_day(a, b)
           birthday1 , birthday2 = Date(a, "y-m-d"), Date(b, "y-m-d")
           day1, day2 = Dates.date2epochdays(birthday1), Dates.date2epochdays(birthday2)
           if day1>day2
               day1, day2 = day2, day1
           end
           n=day1-2*day2
           (n, Dates.epochdays2date(abs(n)))
end

# generalized version of previous function finding the number of days and date where one is nth older than other

function double_day(a, b, m)
           birthday1 , birthday2 = Date(a, "y-m-d"), Date(b, "y-m-d")
           day1, day2 = Dates.date2epochdays(birthday1), Dates.date2epochdays(birthday2)
           if day1>day2
               day1, day2 = day2, day1
           end
           n=day1-m*day2
           (n, Dates.epochdays2date(abs(n)))
end

