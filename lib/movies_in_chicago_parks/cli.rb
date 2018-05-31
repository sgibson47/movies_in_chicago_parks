class CLI

  def call
    puts "Welcome! Welcome! Welcome!"
    list_movies
    menu
  end

  def list_movies
    puts "Movies in Chicago's Parks"
    puts "1. Ferris Bueller's Day Off"
    puts "2. The Birdcage"
    puts "3. The Princess Bride"
  end

  def menu
    puts "Enter the number of the movie for which you want details or exit to quit."
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
      when "exit"
        break
      end
    end
  end
end