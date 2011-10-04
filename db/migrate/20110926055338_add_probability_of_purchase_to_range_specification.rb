class AddProbabilityOfPurchaseToRangeSpecification < ActiveRecord::Migration
  def self.up
    add_column :range_specifications, :min_probability_of_purchase, :integer
    add_column :range_specifications, :max_probability_of_purchase, :integer
  end

  def self.down
    remove_column :range_specifications, :max_probability_of_purchase
    remove_column :range_specifications, :min_probability_of_purchase
  end
end
