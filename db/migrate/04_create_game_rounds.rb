class CreateGameRounds  < ActiveRecord::Migration[4.2]
    
    def change
        create_table :game_rounds do |x|
            x.integer :user_id
            x.integer :movie_id
            x.integer :points
        end 
    end 
    
end 