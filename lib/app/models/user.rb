class  User < ActiveRecord::Base
    has_many :game_rounds
end 