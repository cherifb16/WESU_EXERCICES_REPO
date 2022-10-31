file = File.open("data.txt", "r")
n = 1
file.each_line do |line|
	puts "#{n}行目 #{line}"
  n += 1
end
file.close

