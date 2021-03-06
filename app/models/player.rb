class Player < ApplicationRecord #user
    has_many :match_players
    has_many :matches, through: :match_players
    # belongs_to :team_a, class_name: "Team"
    # belongs_to :team_b, class_name: "Team"

    scope :player, -> { where(player: true) }

    validates :name, presence:{message: "A player must have a name!"}
    validates :player_number, presence:true 
end
