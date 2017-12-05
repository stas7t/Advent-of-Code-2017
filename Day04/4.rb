answer1 = 0
answer2 = 0

def passphrase_valid?(arr)
  arr.uniq.length == arr.length
end

def without_anagram?(arr)
  arr.map!{ |elem| elem.split('').sort.join('') }
  passphrase_valid?(arr)
end

File.readlines('input.txt').each do |line|
  arr = line.split(' ')
  answer1 += 1 if passphrase_valid?(arr)
  answer2 += 1 if without_anagram?(arr)
end

puts "Part One puzzle answer is #{answer1}" # 337
puts "Part Two puzzle answer is #{answer2}" # 231
