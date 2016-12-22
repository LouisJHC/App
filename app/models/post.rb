class Post < ActiveRecord::Base
    validates :title, presence: true, length: {minimum: 2 }
    validates :content, presence: true
    has_many :comments
end
