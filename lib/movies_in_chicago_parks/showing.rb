require_relative './park.rb'
class Showing
  attr_accessor :name, :date, :time, :park, :url
  @@all = []

  def self.all
    @@all
  end
  
  def park_name=(name)
    self.park = Park.find_or_create_by_name(name)
    @park.add_showing(self)
  end


  show_1 = Showing.new
  show_1.name = "Ferris Bueller's Day Off"
  show_1.date = "Jun 1, 2018"
  show_1.time = "6:30 - 8:30pm"
  show_1.park_name=("Lincoln Park")
  show_1.url = "url"
  @@all << show_1


  show_2 = Showing.new
  show_2.name = "The Birdcage"
  show_2.date = "Jun 2, 2018"
  show_2.time = "7:30 - 9:30pm"
  show_2.park_name=("Berger Park")
  show_2.url = "url"
  @@all << show_2

  show_3 = Showing.new
  show_3.name = "The Princess Bride"
  show_3.date = "Jun 3, 2018"
  show_3.time = "7:00 - 9:00pm"
  show_3.park_name=("Wicker Park")
  show_3.url = "url"
  @@all << show_3
end
