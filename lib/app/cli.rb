require "pry"

class CLI

    def run
        all_movies = Movie.all
        @prompt = TTY::Prompt.new
        @pastel = Pastel.new
        @user = nil
        title_crawl


        while true 
            main_menu
        end 

    end

    def title_crawl
        `reset`
        puts @pastel.red("Welcome to the Movie Game \n\n")
        sleep 1
        puts "The fate of humanity rests on your knowledge of movies, actors, and movie plots \n\n"
        sleep 1
        puts "If you are ready, speak 'friend' and enter the movie game..."
        user_input = gets.chomp.downcase
        if user_input == "friend" 
            puts "Noice job...nerd \n\n\n\n"
            main_menu
        else 
            `say 'Hobbit,please. Try again'`
            puts "If you can't figure this out its because we havent become 'close-personal-acquaintances'"
            title_crawl
            
        end 
    end
    

   def main_menu
    puts "You have passed the first time."
    puts  "Maybe humanity isn't doomed after all...but it's early still"
    `say "ha ha ha ha haaah. Well Done\n\n\n\n"`
    puts "Main Menu"
    choices = ["Enter Username", "Reset User Game Data", "Start Game", "Exit"]
    choice = @prompt.enum_select("What would you like to do?", choices)
        if choice == choices[0]
            enter_username
        elsif choice == choices[1]
            reset_data
        elsif choice == choices[2]
            start_game
        else choice == choices[3]
            puts "Smart move. I would have destoryed you."
            exit
        end 
   end 

   def enter_username
    puts "enter a username"
    name = gets.chomp
    @user = User.find_or_create_by(name: name)
   end 

   def reset_data

   end 

   def start_game
    question_generator
   end 

   def question_generator
    `reset`
    movie = Movie.all.sample
    question = [movie.title, movie.plot, movie.actors].sample
    case question
        when @title
            puts "Name an actor who apeared in #{movie.title}."
            user_input1 = gets.chomp.downcase
            question.any? {|x| x.actors.downcase == user_input1}
                if true
                    puts "Well played human. I will defeat you next time"
                    sleep 2
                    question_generator
                else false
                    puts "Incorrect. Pre-pare to die, human..."
                    sleep 2
                    puts "\n\n"
                    `say 'Game Over'`
                    puts "GAME OVER"
                    exit
                end 
        when @plot
            puts "Name the movie title that goes with the following description: #{movie.plot}"
            user_input2 = gets.chomp
            if user_input2.downcase == movie.title.downcase
                puts "Well played human. I will defeat you next time..."
                sleep 2
                question_generator
            else 
                puts "Incorrect. Pre-pare to die, human"
                sleep 2
                    puts "\n\n"
                    `say 'Game Over'`
                    puts "GAME OVER"
                    sleep 2
                    exit
            end 
        else 
            
            puts "Name the movie that this collection of actors appears in. #{movie.actors}"
            user_input3 = gets.chomp.downcase
            
            if user_input3 == movie.title.downcase
                puts "Well played human. I will defeat you next time..."
                sleep 2
                question_generator
            else
                puts "Incorrect. Pre-pare to die, human"
                    sleep 1
                    puts "\n\n"
                    `say 'Game Over'`
                    puts "GAME OVER"
                    sleep 2
                    exit
            end 

            
        end

    
end 
    
       
   





end 

