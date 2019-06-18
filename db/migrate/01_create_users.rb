class CreateUsers < ActiveRecord::Migration[4.2]
    def change
        create_table :users do |user|
            user.text :name
            user.integer :score
        end 
    end 

end 