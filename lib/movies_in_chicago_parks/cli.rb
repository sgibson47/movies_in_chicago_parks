require 'pry'
require_relative './showing.rb'
require_relative './park.rb'
require_relative './gate.rb'
class CLI

  def menu
    puts "How would you like to explore movies in the park?"
    puts "\n"
    puts "Enter -by name- to see a list of all the movies playing in Chicago's parks by name."
    puts "Enter -by date- to see a list of the dates on which there's a movie playing in one of Chicago's parks."
    puts "Enter -by park- to see a list of the parks in which movies are playing."
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
        puts "Please type by name, by date, by park, or exit."
      end
    end
  end

  def list_by_name
    puts "\n"
    puts "Movies"
    Showing.all.each_with_index {|showing, i|
      puts "#{i + 1}. #{showing.name}"}
    puts "\n"
    puts "Enter a number to see details for that movie,"
    puts " or enter back to go back to the main menu."

    input = nil 
  
    while input != "back"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Showing.all.length
        showing = Showing.all[input.to_i - 1]
        showing.display_details
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
    puts "Dates"
    Gate.all.each_with_index {|date, i|
      puts "#{i + 1}. #{date.month} #{date.day}, #{date.year}"}
    puts "\n"
    puts "Enter a number to see which movies are playing on that date,"
    puts " or enter back to go back to the main menu."
    
    input = nil

    while input != "back"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Gate.all.length
        date = Gate.all[input.to_i - 1]
        date.list_showings
        puts "\n"
        puts "Enter a number to see details for that showing,"
        puts " or enter back to go back to the main menu."
        input_ = nil
        while input != "return"
          input = gets.strip
          if input.to_i > 0 && input.to_i <= date.showings.length
            showing = date.showings[input.to_i - 1]
            showing.display_details
            puts "\n"
            puts "Enter another number from the list of showings"
            puts "or return to return to the list of dates."
          elsif input == "return"
            break
          else
            puts "I can't tell what you want."
            puts "Please type a number from the list of showings on this day"
            puts "or return to return to the list of dates."
          end
        end
        puts "Dates"
        Gate.all.each_with_index {|date, i|
          puts "#{i + 1}. #{date.month} #{date.day}, #{date.year}"}
        puts "\n"
        puts "Enter a number to see which movies are playing on that date,"
        puts " or enter back to go back to the main menu."
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
    puts "Parks"
    Park.all.each_with_index {|park, i|
      puts "#{i + 1}. #{park.name}"}
    puts "\n"
    puts "Enter a number to see which movies are playing in that park,"
    puts " or enter back to return to the main menu."
    
    input = nil

    while input != "back"
      input = gets.strip
      if input.to_i > 0 && input.to_i <= Park.all.length
        park = Park.all[input.to_i - 1]
        park.list_showings
        puts "\n"
        puts "Enter a number to see details for that showing,"
        puts " or enter back to return to the main menu."
        input = nil
        while input != "return"
          input = gets.strip
          if input.to_i > 0 && input.to_i <= park.showings.length
            showing = park.showings[input.to_i - 1]
            showing.display_details
            puts "\n"
            puts "Enter another number from the list of showings"
            puts "or return to return to the list of parks."
          elsif input == "return"
            break
          else
            puts "I can't tell what you want."
            puts "Please type a number from the list of showings in this park"
            puts "or return to return to the list of parks."
          end
        end
        puts "Parks"
        Park.all.each_with_index {|park, i|
          puts "#{i + 1}. #{park.name}"}
        puts "\n"
        puts "Enter a number to see which movies are playing in that park,"
        puts " or enter back to go back to the main menu."
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

