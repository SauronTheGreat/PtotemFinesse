class MediaForRound < ActiveRecord::Base
  belongs_to :round
  belongs_to :medium
end
