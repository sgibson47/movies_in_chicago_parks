class Gate
  attr_accessor :day, :month, :year, :name
  attr_reader :showings

  @@all = []

  def initialize(name)
    @name = name
    data = name.split(/, | /)
    @month = data[1]
    @day = data[2]
    @year = data[3]
    @showings = []
    self.save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_or_create_by_name(name)
    if @@all.any? {|gate| 
      data = name.split(/, | /)
      data[1] == @month &&
      data[2] == @day &&
      data[3] = @year}
      @@all.find {|gate| 
        data = name.split(/, | from /)
        data[1] == @month &&
        data[2] == @day &&
        data[3] = @year}
    else
      gate_1 = Gate.new(name)
    end
  end

  def add_showing(showing)
    @showings << showing
  end 

  def list_showings
    self.showings.each_with_index {|showing, i|
      puts "#{i + 1}. #{showing.name} - #{showing.date.month} #{showing.date.day}, #{showing.date.year}"}
  end 


end