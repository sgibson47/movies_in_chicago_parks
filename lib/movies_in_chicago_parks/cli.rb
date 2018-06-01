require 'pry'
require_relative './showing.rb'
require_relative './park.rb'
class CLI

  def menu
    puts "How would you like to explore movies in the park?"
    puts "\n"
    puts "Enter -by name- to see a list of all the movies playing in Chicago's parks by name."
    puts "Enter -by date- to see a list of the dates on which there's a movie playing in one of Chicago's parks."
    puts "Enter -by park- to see a list of the parks in which movies are playing."
    puts "\n"
    puts "Once you pick, you'll get to select from the list to get further details."
    puts "\n"
    
    input = nil

    while input != "exit"
      case input = gets.strip
      when "by name"
        list_by_name
      when "by date"
        list_by_date
      when "by park"
        list_by_park
      when "exit"
        break
      else
        puts "Hrm, I'm not sure what you want."
        puts "Please type by name, by date, by park, or exit."
      end
    end
  end

  def list_by_name
    puts "\n"
    Showing.all.each_with_index {|showing, i|
      puts "#{i + 1}. #{showing.name}"}
    puts "\n"
    puts "Enter a number to see when and where that movie is playing,"
    puts " or enter back to return to the main menu."

    input = nil 
  
    while input != "back"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Showing.all.length
        showing = Showing.all[input.to_i - 1]
        puts "#{showing.name} is playing at #{showing.time}"
        puts "on #{showing.date} in #{showing.park.name}."
        puts "\n"
        puts "Enter another number from the list or back."
      elsif input == "back"
        break
      else
        puts "Hrm, I'm not sure what you want."
        puts "Please type a number from the list or back."
      end
    end

    puts "\n"
    puts "Welcome back to the main menu."
    puts "Please type by name, by date, or by park to see a list, or exit."
  end

  def list_by_date
    puts "\n"
    
    Showing.all.each_with_index {|showing, i|
      puts "#{i + 1}. #{showing.date}"}
    
    puts "\n"
    puts "Enter a number to see which movies are playing on that date,"
    puts " or enter back to return to the main menu."
    
    input = nil

    while input != "back"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Showing.all.length
        showing = Showing.all[input.to_i - 1]
        puts "#{showing.name} is playing at #{showing.time}"
        puts "on #{showing.date} in #{showing.park.name}."
        puts "\n"
        puts "Enter another number from the list or back."
      elsif input == "back"
        break
      else
        puts "Hrm, I'm not sure what you want."
        puts "Please type a number from the list or back."
      end
    end

    puts "\n"
    puts "Welcome back to the main menu."
    puts "Please type by name, by date, or by park to see a list, or exit."
  end

  def list_by_park
    puts "\n"
    
    Showing.all.each_with_index {|showing, i|
      puts "#{i + 1}. #{showing.park}"}
    
    puts "\n"
    puts "Enter a number to see which movies are playing in that park,"
    puts " or enter back to return to the main menu."
    
    input = nil

    while input != "back"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Showing.all.length
        showing = Showing.all[input.to_i - 1]
        puts "#{showing.name} is playing at #{showing.time}"
        puts "on #{showing.date} in #{showing.park.name}."
        puts "\n"
        puts "Enter another number from the list or back."
      elsif input == "back"
        break
      else
        puts "Hrm, I'm not sure what you want."
        puts "Please type a number from the list or back."
      end
    end

    puts "\n"
    puts "Welcome back to the main menu."
    puts "Please type by name, by date, or by park to see a list, or exit."
  end

end

