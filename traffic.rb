require 'time'
require 'terminal-table'
require 'tty' # gem install tty

# $ irb --simple-prompt
# >> load 'traffic.rb'
# >> Main.incidents
# >> Main.run
#
class Main

  @@prompt = TTY::Prompt.new

  @@incidents = [
    {street: "batman", time: "08 AM", time_until: "10 AM", condition: "Closure"},
    {street: "folk", time: "09 PM", time_until: "11 PM", condition: "Hazard"}
  ]

  def self.street_info
    print "Provide street name for info ? "
    street_name = gets.chomp
    info = @@incidents.find {|i| i[:street].strip.downcase == street_name.strip.downcase}
    if info.nil?
      puts "We have no current information for this street name..."
      puts "We have information on the following streets: "
      @@incidents.each {|i| puts "\tStreet: #{i[:street]}" }
    else
      puts "We have the following info for this street #{info}"
    end
  end

  def self.get_time_str
    # Get valid time in 24 hour format
    begin
      print "Provide time of interest (in 24 hour format HH:MM)? "
      time_str = gets.chomp
      if (time_str =~ /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/).nil?
          puts "Invalid time format. Please try again."
      else
          break # continue processing the time
      end
    end while true
    time_str
  end

  def self.process_time(time_str)
    # Find all incedents that overlap with the given time
    time = Time.parse(time_str)
    matches = @@incidents.select {|i|
        t = Time.parse(i[:time]);
        ut = Time.parse(i[:time_until]);
        (time >= t && time <= ut)
      }
    if matches.empty?
      puts "There are no incidents for this time..."
    else
      matches.each {|i| puts i }
    end
  end

  def self.condition_info
    # Psuedo Code:
    #
    # ...
    condition = @@prompt.select("Enter condition to search ? ",
      %w{ Closure Hazard Collision BAC_test })
    matches = @@incidents.select {|i| i[:condition] == condition }
    if matches.empty?
      puts "There are no incidents for this condition..."
    else
      matches.each {|i| puts i }
    end
  end

  def self.run
    display_table
    begin

      street_info

      time_str = get_time_str

      process_time( time_str )

      condition_info

      print "Do you want to exit (y/n)? "
      choice = gets.chomp
    end while choice.downcase.include?("n")
  end

  def self.display_table
    rows = []
    @@incidents.each do |i|
      rows << [i[:street]]
    end
    table = Terminal::Table.new :headings => ['Street'], :rows => rows
    puts table
  end

  def self.incidents
    @@incidents
  end

end
