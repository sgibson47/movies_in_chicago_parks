require_relative './showing.rb'

class Park
  attr_accessor :name, :showings

  @@all =[]

  def initialize(name)
    @name = name
    @showings = []
    self.save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    self.all.detect {|n| n.name == name}
  end

  def self.find_or_create_by_name(name)
    if @@all.any? {|park| park.name == name}
      @@all.find {|park| park.name == name}
    else
      park_1 = Park.new(name)
    end
  end

  def add_showing(showing)
    @showings << showing
  end


end