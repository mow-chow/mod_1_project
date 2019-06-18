class Movie < ActiveRecord::Base
    has_many :questions
    has_many :game_rounds, through: :questions

end 