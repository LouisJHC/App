class Post < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 2 }
    validates :content, presence: true
    validates :address, presence: true
    validates :distance, presence: true

    has_many :comments, dependent: :destroy
    belongs_to :user
    belongs_to :category
    belongs_to :search
    
    geocoded_by :address
    after_validation :geocode
end
