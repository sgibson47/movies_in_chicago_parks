require 'pry'
class CLI

  def call
    menu
  end

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
    puts "1. Ferris Bueller's Day Off"
    puts "2. The Birdcage"
    puts "3. The Princess Bride"
    puts "\n"
    puts "Enter a number to see when and where that movie is playing."

    input = nil 
  
    while input != "back"
      case input = gets.strip
      when "1"
        puts "Ferris Bueller's Day Off is playing at 6:30pm on Jun 1, 2018 in Lincoln Park."
      when "2"
        puts "The Birdcage is playing at 7:30pm on Jun 2, 2018 in Berger Park."
      when "3"
        puts "The Princess Bride is playing at 8:30pm on Jun 3, 2018 in Wicker Park."
      when "back"
        break
      else
        puts "Hrm, I'm not sure what you want."
        puts "Please type a number 2or back."
      end
    end

    puts "\n"
    puts "Welcome back to the main menu."
    puts "Please type by name, by date, or by park to see a list, or exit."
  end

  def list_by_date
    puts "\n"
    puts "1. Jun 1, 2018"
    puts "2. Jun 2, 2018"
    puts "3. Jun 3, 2018"
    puts "\n"
    puts "Enter a number to see which movies are playing on that date."
    input = nil

    while input != "back"
      case input = gets.strip
      when "1"
        puts "Ferris Bueller's Day Off is playing at 6:30pm on Jun 1, 2018 in Lincoln Park."
      when "2"
        puts "The Birdcage is playing at 7:30pm on Jun 2, 2018 in Berger Park."
      when "3"
        puts "The Princess Bride is playing at 8:30pm on Jun 3, 2018 in Wicker Park."
      when "back"
        break
      else
        puts "Hrm, I'm not sure what you want."
        puts "Please type a number or back."
      end
    end

    puts "\n"
    puts "Welcome back to the main menu."
    puts "Please type by name, by date, or by park to see a list, or exit."
  end

  def list_by_park
    puts "\n"
    puts "1. Lincoln Park"
    puts "2. Berger Park"
    puts "3. Wicker Park"
    puts "\n"
    puts "Enter a number to see which movies are playing in that park."
    input = nil

    while input != "back"
      case input = gets.strip
      when "1"
        puts "Ferris Bueller's Day Off is playing at 6:30pm on Jun 1, 2018 in Lincoln Park."
      when "2"
        puts "The Birdcage is playing at 7:30pm on Jun 2, 2018 in Berger Park."
      when "3"
        puts "The Princess Bride is playing at 8:30pm on Jun 3, 2018 in Wicker Park."
      when "back"
        break
      else
        puts "Hrm, I'm not sure what you want."
        puts "Please type a number or back."
      end
    end

    puts "\n"
    puts "Welcome back to the main menu."
    puts "Please type by name, by date, or by park to see a list, or exit."
  end

end

