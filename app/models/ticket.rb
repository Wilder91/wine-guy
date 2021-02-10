class Ticket < ActiveRecord::Base
    belongs_to :user 
    belongs_to :wine
end
