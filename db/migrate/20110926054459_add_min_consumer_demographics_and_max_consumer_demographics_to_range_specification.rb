class AddMinConsumerDemographicsAndMaxConsumerDemographicsToRangeSpecification < ActiveRecord::Migration
  def self.up
    add_column :range_specifications, :min_consumer_demographics, :integer
    add_column :range_specifications, :max_consumer_demographics, :integer
  end

  def self.down
    remove_column :range_specifications, :max_consumer_demographics
    remove_column :range_specifications, :min_consumer_demographics
  end
end
