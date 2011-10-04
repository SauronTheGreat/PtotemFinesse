class Medium < ActiveRecord::Base

  has_many :media_for_rounds,:dependent => :destroy
  has_many :rounds,:through=>:media_for_rounds

end
