class Gym < ApplicationRecord
	has_many :memberships, dependent: :delete_all
	has_many :clients, through: :memberships

	validates :name, presence: true
	validates :address, presence: true
end
