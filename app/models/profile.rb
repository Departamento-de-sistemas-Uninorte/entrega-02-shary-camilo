class Profile < ApplicationRecord
	
validates :tweet, length: {maximum: 280}


end
