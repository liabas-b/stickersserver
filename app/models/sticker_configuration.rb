class StickerConfiguration < ActiveRecord::Base
  attr_accessible :activate, :frequency_update, :sticker_code
#
  def self.search(search, column = 'code')
    if search
      where("#{column} LIKE ?", "%#{search}%")
    else
      scoped
    end
  end

end
