class CreateValidators < ActiveRecord::Migration
  def self.up
    create_table :validators do |t|
      t.string :name
      t.integer :validator_targets_count, :default => 0
      t.integer :antibodies_count, :default => 0
      t.integer :validations_count, :default => 0
      t.timestamps
    end
    add_index :validators, :name, :unique => true
  end

  def self.down
    drop_table :validators
  end
end