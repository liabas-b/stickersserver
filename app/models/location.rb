class Location < ActiveRecord::Base
  attr_accessible :date, :latitude, :longitude, :options, :sticker_code
#
  before_save :set_date

  def self.search(search, column = 'code')
    if search
      where("#{column} LIKE ?", "%#{search}%")
    else
      scoped
    end
  end

  private

  def set_date
  	self.date = Time.now
  end

end
