class HrIncentive < ActiveRecord::Base
      has_many :hr_incentive_for_rounds,:dependent => :destroy
      has_many :rounds,:through=>:hr_incentive_for_rounds

end
