class CreateMediaForRounds < ActiveRecord::Migration
  def self.up
    create_table :media_for_rounds do |t|
      t.integer :round_id
      t.integer :medium_id
      t.integer :min_limit
      t.integer :max_limit

      t.timestamps
    end
  end

  def self.down
    drop_table :media_for_rounds
  end
end
