require "pry"

class CLI

    def run
        all_movies = Movie.all
        @prompt = TTY::Prompt.new
        @pastel = Pastel.new
        @user = nil
        font = TTY::Font.new(:doom)
        title_crawl


        while true 
            main_menu
        end 

    end

    def title_crawl
        `reset`
        puts @pastel.red("Welcome to...\n\n\n\n")
        sleep 1
        font = TTY::Font.new(:doom)
        pastel = Pastel.new
        puts pastel.yellow(font.write("The Movie Game", letter_spacing: 1))
        `say 'Welcome to The Movie Game'`
        puts @pastel.magenta("Developed with love and pizza by: Cat, Nerajno & Chris")
        sleep 2
        puts pastel.red("\n\n\nThe fate of humanity rests on your knowledge of movies, actors, and movie plots \n\n")
        sleep 1
        puts pastel.red("If you are ready...\n\n")
        sleep 1
        puts @pastel.cyan("Speak friend and enter the movie game")
        user_input = gets.chomp.downcase
        if user_input == "friend" 
            puts "\n\n\n Noice job...Gandork \n\n\n\n"
            main_menu
        else 
            `say 'Hobbit,please. Try again'`
            puts "If you can't figure this out its because we havent become 'close-personal-acquaintances'"
            title_crawl
            
        end 
    end
    

   def main_menu
    `say "ha ha ha ha haaah. Well Done"`
    puts "You have passed the first time.\n\n\n"
    sleep 1
    puts  "Maybe humanity isn't doomed after all...but it's early still\n\n\n"
    sleep 1
    pastel = Pastel.new
    puts pastel.green("Main Menu")
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
    pastel = Pastel.new
    movie = Movie.all.sample
    
   # question = [movie.title, movie.plot, movie.actors].sample
    question = [:title, :plot, :actor ].sample
    
    case question
        when :title
            puts @pastel.green("Name an actor who apeared in #{movie.title}.")
            user_input1 = gets.chomp.downcase
            
            movie.actors.include?(user_input1.downcase)
                if true
                    puts @pastel.cyan("Well played human. I will defeat you next time")
                    sleep 1
                    question_generator
                else false
                    puts @pastel.red"Incorrect. Pre-pare to die, human..."
                    sleep 1
                    puts "\n\n"
                    `say 'Game Over'`
                    puts  font = TTY::Font.new(:doom)
                    pastel = Pastel.new
                    puts pastel.red(font.write("GAME OVER", letter_spacing: 1))
                    title_crawl
                end 
        when :plot
            puts @pastel.green("Name the movie title that goes with the following description: #{movie.plot}")
            user_input2 = gets.chomp
            if user_input2.downcase == movie.title.downcase
                puts @pastel.cyan("Well played human. I will defeat you next time...")
                sleep 2
                question_generator
            else 
                puts @pastel.red("Incorrect. Pre-pare to die, human")
                sleep 2
                    puts "\n\n"
                    `say 'Game Over'`
                    puts  font = TTY::Font.new(:doom)
                    pastel = Pastel.new
                    puts pastel.red(font.write("GAME OVER", letter_spacing: 1))
                    title_crawl
                    
            end 
        else 
            
            puts @pastel.green("Name the movie that this collection of actors appears in. #{movie.actors}")
            user_input3 = gets.chomp.downcase
            
            if user_input3 == movie.title.downcase
                puts @pastel.cyan("Well played human. I will defeat you next time...")
                sleep 2
                question_generator
            else
                puts "Incorrect. Pre-pare to die, human"
                    sleep 1
                    puts "\n\n"
                    `say 'Game Over'`
                    font = TTY::Font.new(:doom)
                    pastel = Pastel.new
                    puts pastel.red(font.write("GAME OVER", letter_spacing: 1))
                    title_crawl

            end 

            
        end

    
end 
    
       
   





end 

