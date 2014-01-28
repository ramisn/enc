class Event < ActiveRecord::Base

    belongs_to :category
    belongs_to :venue

    def self.search(search)
        where(['category = ?', search])
	 end

end
