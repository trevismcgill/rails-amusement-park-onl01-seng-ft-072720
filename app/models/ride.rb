class Ride < ApplicationRecord
    belongs_to :user
    belongs_to :attraction

    def take_ride
        user = User.find_by_id(self.user_id)
        attraction = Attraction.find_by_id(self.attraction_id)

        if user.tickets >= attraction.tickets && user.height >= attraction.min_height
            user.tickets = user.tickets - attraction.tickets
            user.nausea = user.nausea + attraction.nausea_rating
            user.happiness = user.happiness + attraction.happiness_rating
            user.save
        elsif user.tickets < attraction.tickets && user.height < attraction.min_height
            "Sorry. You do not have enough tickets to ride the Roller Coaster. You are not tall enough to ride the Roller Coaster."
        elsif user.tickets < attraction.tickets
            "Sorry. You do not have enough tickets to ride the Roller Coaster."
        elsif user.height < attraction.min_height
            "Sorry. You are not tall enough to ride the Roller Coaster."
        end
    end
end
