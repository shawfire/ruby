require 'date'
require 'tty'
require 'csv'

class Task

  #TODO load from file
  @@task_count = 0

  #TODO read tasks from csv file.
  @@tasks = []
  filename = 'task_list.csv'
  if (File.file?( filename ))
    File.open(filename, "r") do |aFile|

       # ... process the file
       headers = aFile.gets.chomp

       # skip white space, find " '
       print aFile.read
    end
  end

  def initialize(day:, description:, time:, location:)
    @day = day
    @description = description
    @time = time
    @location = location
    self.class.task_count += 1
    @task_number = @@task_count
    @@tasks.push(self)
    #TODO undate csv file.
  end

  def self.task_count
    @@task_count
  end

  def self.enter_tasks
    begin

      prompt = TTY::Prompt.new
      day = prompt.select("Choose a day for your task?",
        Date::DAYNAMES)
      # day = prompt.select("Choose a day for your task?",
      #   %w(Mon Tue Wed Thu Fri Sat Sun))

      print "Describe your task? "
      description = gets.chomp

      #TODO type in time and validate with a regex
      time = prompt.select("Choose a time for your task?",
        %w(01:00 02:00 03:00 04:00 05:00 06:00 07:00))

      #TODO use ruby gem to validate location
      print "Location of task? "
      location = gets.chomp

      prompt = TTY::Prompt.new
      choice = prompt.yes?('Do you want to add another task?')
      # => Do you want to add another task? (Y/n)

      Task.new(day: day, description: description, time: time,
        location: location)

    end while choice

    #TODO save tasks to csv file...

  end

  def self.tasks
    @@tasks
  end

end

# irb
# >> load 'task_list.rb'
# >> Task.enter_tasks
# Choose a day for your task? Tue
# Describe your task? meetup
# Choose a time for your task? 06:00
# Location of task? melb
# Do you want to add another task? no
# =>
# >> Task.tasks
# => [#<Task:0x007fc473937800 @day="Tue", @description="meetup", @time="06:00", @location="melb">]
# >>
