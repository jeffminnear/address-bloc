# takes a greeting and 0 or more names
# greets each name with the designated greeting
def greet
  greeting = ARGV.first
  (1...ARGV.length).each do |argument_number|
    puts "#{greeting} #{ARGV[argument_number]}"
  end
end

greet
