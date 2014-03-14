# The question was using the fib array, write a method to return as many numbers
# of the Fibonacci sequence as the user requests. If the question wouldn't have included
# the fib array the method would be a little simpler.

def fibo(num)
	fib = [0, 1]
	arr = []
	if num <= 2
		x = 0
		num.times { arr << fib[x] ; x+=1 }
	else
		arr = fib
		arr << 1
		num -= 3
		num.times { arr << arr[arr.length-1] + arr[arr.length-2] }
	end
	return arr
end

# puts  "How many numbers of the Fibonacci sequence do you want?"
x = gets.chomp.to_i
result = fibo(x)
puts result
fibo(x)
