class Event < ActiveRecord::Base

    def self.search(search)
    #def self.search(search)   
      where(['category = ?', search])

  #find(:all, :conditions => ['category LIKE ?', "%#{search}%"])
  end

end
