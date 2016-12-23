class Search < ActiveRecord::Base
    def self.search(search)
        if search
            find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
        else
            find(:all)
        end
    end
    
    # geocoded_by :search_address
    # after_validation :geocode
end
