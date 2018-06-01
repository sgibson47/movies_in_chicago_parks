require 'pry'
class CLI

  def call
    puts "Welcome! Welcome! Welcome!"
    list_movies
    menu
    binding.pry
  end

  def list_movies
    puts "Movies in Chicago's Parks"
    puts "1. Ferris Bueller's Day Off"
    puts "2. The Birdcage"
    puts "3. The Princess Bride"

  end

  def menu
    puts "Enter the number of the movie for which you want details, or type list to see the list again, or exit to quit."
    input = nil

    while input != "exit"
      input = gets.strip
      case input
      when "1"
        puts "more info on showing of Ferris Bueller's Day Off."
      when "2" 
        puts "more info on showing of The Birdcage."
      when "3"
        puts "more info on showing of The Princess Bride."
      when "list"
        list_movies
      when "exit"
        break
      else
        puts "Hrm, I'm not sure what you want. Please type a number from the list, list, or exit."
      end
    end
  end
end