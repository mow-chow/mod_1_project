class CreateMovies < ActiveRecord::Migration[4.2]

    def change
        create_table :movies do |movie|
            movie.string :title
            movie.string :plot
            movie.string :actors
        end
    end 


end 

