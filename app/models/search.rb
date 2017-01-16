class Search < ActiveRecord::Base
    # def self.search(search)
    #     # return scoped unless search.present?
    #     # where(['user_search LIKE ?', "%#{search}%"])
    #     return "#{search}"
    # end
    belongs_to :post
    
    validates :user_search, presence: true
    
end
