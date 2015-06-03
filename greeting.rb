sGreeting = ARGV.first
ARGV.last(ARGV.length-1).each {|n| puts "#{sGreeting} #{n}"}
