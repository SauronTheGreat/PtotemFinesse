class AddPriceEffectToRangeSpecification < ActiveRecord::Migration
  def self.up
    add_column :range_specifications, :min_effect_of_price, :integer
    add_column :range_specifications, :max_effect_of_price, :integer
  end

  def self.down
    remove_column :range_specifications, :max_effect_of_price
    remove_column :range_specifications, :min_effect_of_price
  end
end
