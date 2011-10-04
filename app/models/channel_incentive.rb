class ChannelIncentive < ActiveRecord::Base

  has_many :channel_incentive_for_rounds,:dependent => :destroy
  has_many :rounds,:through=>:channel_incentive_for_rounds

end
