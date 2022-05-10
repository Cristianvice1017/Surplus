class Profile < ApplicationRecord
	belongs_to :user

	validates :phonenumber, presence: true
end
