class AddRangeToHrIncentiveForRound < ActiveRecord::Migration
  def self.up
    add_column :hr_incentive_for_rounds, :min_limit, :integer
    add_column :hr_incentive_for_rounds, :max_limit, :integer
  end

  def self.down
    remove_column :hr_incentive_for_rounds, :max_limit
    remove_column :hr_incentive_for_rounds, :min_limit
  end
end
