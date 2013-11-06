class Location < ActiveRecord::Base
  attr_accessible :date, :latitude, :longitude, :sticker_code, :is_new
  before_save :set_date
  after_create :after_create_callback

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
      selrf.is_new = true
  end

  def after_create_callback
    # PousseMailer.new_location(self).deliver
  end

end
