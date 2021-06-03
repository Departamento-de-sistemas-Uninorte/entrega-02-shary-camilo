class Profile < ApplicationRecord
	
belongs_to :user, optional: true
validates :tweet, length: {maximum: 280}
validates :tweet, presence: true
validates :user_name, presence: true
has_one_attached :image
end
