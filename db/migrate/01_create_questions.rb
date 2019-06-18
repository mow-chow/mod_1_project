class CreateQuestions < ActiveRecord::Migration[4.2]
    def change
        create_table :questions do |question|
            question.integer :movie_id
            question.text :content
            question.integer :points
        end 
    
    end 


end 