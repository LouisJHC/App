class Post < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 2 }
    validates :content, presence: true
    validates :address, presence: true

    has_many :comments, dependent: :destroy
    
    geocoded_by :address
    after_validation :geocode
end
