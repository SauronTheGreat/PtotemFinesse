class AddMinEffectAndMaxEffectToDepartment < ActiveRecord::Migration
  def self.up
    add_column :departments, :min_effect_limit, :integer
    add_column :departments, :max_effect_limit, :integer
  end

  def self.down
    remove_column :departments, :max_effect_limit
    remove_column :departments, :min_effect_limit
  end
end
