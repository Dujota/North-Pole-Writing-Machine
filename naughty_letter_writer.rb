require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_sample_letter.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  gender   = kid_data_array[1]
  behavior = kid_data_array[2]
  toys     = kid_data_array[3..8]
  infraction = kid.split('|')[1]
  in_stock = toys.delete("Kaleidoscope")
  random_toy = toys.sample
  what_you_dont_get = toys.reject { |toy| toy == random_toy  }

  # infraction = kid_data_array[15..-1]
# puts kid_data_array

# puts infraction
# puts '-'*44
# puts random_toy
# puts '-'*33
# puts what_you_dont_get.join(", ")

  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)

  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
