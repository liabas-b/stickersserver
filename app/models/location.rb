class Location < ActiveRecord::Base
  attr_accessible :date, :latitude, :longitude, :options, :sticker_code

  def self.search(search, column = 'code')
    if search
      where("#{column} LIKE ?", "%#{search}%")
    else
      scoped
    end
  end
end
