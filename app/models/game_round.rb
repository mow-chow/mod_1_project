class GameRound < ActiveRecord::Base 
    has_many :users
    has_many :questions
    has_many :questions, :through :movies
end 