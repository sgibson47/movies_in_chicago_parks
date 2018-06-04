require 'pry'
require_relative './showing.rb'
require_relative './park.rb'
require_relative './gate.rb'
require 'colorize'

class CLI

  def call
    #scrape_park_district
    #scrape_showings
    menu
  end

  def menu
    puts "How would you like to explore movies in the park?".colorize(:blue)
    puts "\n"
    puts "Enter -by name- to see a list of all the movies playing in Chicago's parks by name.".colorize(:blue)
    puts "Enter -by date- to see a list of the dates on which there's a movie playing in one of Chicago's parks.".colorize(:blue)
    puts "Enter -by park- to see a list of the parks in which movies are playing.".colorize(:blue)
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
        puts "Please type by name, by date, by park, or exit.".colorize(:blue)
      end
    end
  end

  def list_by_name
    puts "\n"
    puts "Movies".colorize(:green)
    Showing.all.each_with_index {|showing, i|
      puts "#{i + 1}. #{showing.name}".colorize(:green)}
    puts "\n"
    puts "Enter a number to see details for that movie,".colorize(:green)
    puts " or enter back to go back to the main menu.".colorize(:green)

    input = nil 
  
    while input != "back"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Showing.all.length
        showing = Showing.all[input.to_i - 1]
        showing.display_details
        puts "\n"
        puts "Enter another number from the list or back.".colorize(:green)
      elsif input == "back"
        break
      else
        puts "Hrm, I'm not sure what you want.".colorize(:green)
        puts "Please type a number from the list or back.".colorize(:green)
      end
    end

    puts "\n"
    puts "Welcome back to the main menu.".colorize(:blue)
    puts "Please type by name, by date, or by park to see a list, or exit.".colorize(:blue)
  end

  def list_by_date
    puts "\n"
    puts "Dates".colorize(:blue)
    Gate.all.each_with_index {|date, i|
      puts "#{i + 1}. #{date.month} #{date.day}, #{date.year}".colorize(:blue)}
    puts "\n"
    puts "Enter a number to see which movies are playing on that date,".colorize(:blue)
    puts " or enter back to go back to the main menu.".colorize(:blue)
    
    input = nil

    while input != "back"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Gate.all.length
        date = Gate.all[input.to_i - 1]
        date.list_showings
        puts "\n"
        puts "Enter a number to see details for that showing,".colorize(:green)
        puts " or enter back to go back to the main menu.".colorize(:green)
        input_ = nil
        while input != "return"
          input = gets.strip
          if input.to_i > 0 && input.to_i <= date.showings.length
            showing = date.showings[input.to_i - 1]
            showing.display_details
            puts "\n"
            puts "Enter another number from the list of showings".colorize(:green)
            puts "or return to return to the list of dates.".colorize(:green)
          elsif input == "return"
            break
          else
            puts "I can't tell what you want.".colorize(:green)
            puts "Please type a number from the list of showings on this day".colorize(:green)
            puts "or return to return to the list of dates.".colorize(:green)
          end
        end
        puts "Dates".colorize(:blue)
        Gate.all.each_with_index {|park, i|
          puts "#{i + 1}. #{date.month} #{date.day}, #{date.year}".colorize(:blue)}
        puts "\n"
        puts "Enter a number to see which movies are playing in that park,".colorize(:blue)
        puts " or enter back to go back to the main menu.".colorize(:blue)
      elsif input == "back"
        break
      else
        puts "Hrm, I'm not sure what you want.".colorize(:green)
        puts "Please type a number from the list or back.".colorize(:green)
      end
    end

    puts "\n"
    puts "Welcome back to the main menu.".colorize(:blue)
    puts "Please type by name, by date, or by park to see a list, or exit.".colorize(:blue)
  end
 

  def list_by_park
    puts "\n"
    puts "Parks".colorize(:blue)
    Park.all.each_with_index {|park, i|
      puts "#{i + 1}. #{park.name}".colorize(:blue)}
    puts "\n"
    puts "Enter a number to see which movies are playing in that park,".colorize(:blue)
    puts " or enter back to return to the main menu.".colorize(:blue)
    
    input = nil

    while input != "back"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Park.all.length
        park = Park.all[input.to_i - 1]
        park.list_showings
        puts "\n"
        puts "Enter a number to see details for that showing,".colorize(:green)
        puts " or enter back to return to the main menu.".colorize(:green)
        input = nil
        while input != "return"
          input = gets.strip
          if input.to_i > 0 && input.to_i <= park.showings.length
            showing = park.showings[input.to_i - 1]
            showing.display_details
            puts "\n"
            puts "Enter another number from the list of showings".colorize(:green)
            puts "or return to return to the list of parks.".colorize(:green)
          elsif input == "return"
            break
          else
            puts "I can't tell what you want.".colorize(:green)
            puts "Please type a number from the list of showings in this park".colorize(:green)
            puts "or return to return to the list of parks.".colorize(:green)
          end
        end
        puts "Parks".colorize(:blue)
        Park.all.each_with_index {|park, i|
          puts "#{i + 1}. #{park.name}".colorize(:blue)}
        puts "\n"
        puts "Enter a number to see which movies are playing in that park,".colorize(:blue)
        puts " or enter back to go back to the main menu.".colorize(:blue)
      elsif input == "back"
        break
      else
        puts "Hrm, I'm not sure what you want.".colorize(:green)
        puts "Please type a number from the list or back.".colorize(:green)
      end
    end

    puts "\n"
    puts "Welcome back to the main menu.".colorize(:blue)
    puts "Please type by name, by date, or by park to see a list, or exit.".colorize(:blue)
  end

end

