class Prof < ActiveRecord::Base
    belongs_to :user
    validates :instrument, presence: true
    validates :experience, presence: true
    validates :lesson_type, presence: true
    validates :description, presence: true, length: {maximum: 2000, minimum: 20}
    validates :listing_name, presence: true, length: {maximum: 50}
    validates :price, numericality: {only_integer: false, greather_than: 1}
    validates :address, presence: true
end
