class Event < ActiveRecord::Base

    belongs_to :category

    def self.search(search)
        where(['category = ?', search])
	end

end
