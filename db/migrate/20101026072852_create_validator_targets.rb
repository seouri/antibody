class CreateValidatorTargets < ActiveRecord::Migration
  def self.up
    create_table :validator_targets do |t|
      t.integer :validator_id
      t.integer :target_id
    end
    add_index :validator_targets, :validator_id
  end

  def self.down
    drop_table :validator_targets
  end
end
