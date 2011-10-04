class HrIncentiveForRound < ActiveRecord::Base
  belongs_to :round
  belongs_to :hr_incentive
end
