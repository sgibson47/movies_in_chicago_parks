require_relative './park.rb'
require_relative './gate.rb'

class Showing
  attr_accessor :name, :date, :park, :url
  attr_reader :time
  @@all = []

  def self.all
    @@all
  end
  
  def park_name=(name)
    self.park = Park.find_or_create_by_name(name)
    @park.add_showing(self)
  end

  def date_name=(name)
    self.date = Gate.find_or_create_by_name(name)
    @date.add_showing(self)
  end

  def set_time(date_name)
    data = date_name.split(/, | /)
    @time = "#{data[5]} #{data[6]} to #{data[8]} #{data[9]}"
  end

  def display_details
    puts "#{@name} is playing at #{@time}"
    puts "on #{@date.month} #{@date.day}, #{@date.year} in #{@park.name}."
  end 


  show_1 = Showing.new
  show_1.name = "Ferris Bueller's Day Off"
  show_1.date_name = "Fri, Jun 1, 2018 from 8:30 PM - 10:15 PM"
  show_1.set_time("Fri, Jun 1, 2018 from 8:30 PM - 10:15 PM")
  show_1.park_name=("Lincoln Park")
  show_1.url = "url"
  @@all << show_1


  show_2 = Showing.new
  show_2.name = "The Birdcage"
  show_2.date_name = "Sat, Jun 2, 2018 from 6:30 PM - 8:30 PM"
  show_2.set_time("Sat, Jun 2, 2018 from 6:30 PM - 8:30 PM")
  show_2.park_name=("Berger Park")
  show_2.url = "url"
  @@all << show_2

  show_3 = Showing.new
  show_3.name = "The Princess Bride"
  show_3.date_name = "Sun, Jun 3, 2018 from 7:30 PM - 9:15 PM"
  show_3.set_time("Sun, Jun 3, 2018 from 7:30 PM - 9:15 PM")
  show_3.park_name=("Wicker Park")
  show_3.url = "url"
  @@all << show_3
end
