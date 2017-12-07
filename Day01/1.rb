input = File.read('input.txt').split('')

def captcha_sum(arr, step = 1)
  sum = 0
  arr.length.times do
    sum += arr[0].to_i if arr[0] == arr[step]
    arr.rotate!
  end

  sum
end

sum1 = captcha_sum(input)
puts "Part One puzzle answer is #{sum1}" # 1044

sum2 = captcha_sum(input, input.length / 2)
puts "Part Two puzzle answer is #{sum2}" # 1054
