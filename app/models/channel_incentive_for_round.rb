class ChannelIncentiveForRound < ActiveRecord::Base
  belongs_to :round
  belongs_to :channel_incentive
end
