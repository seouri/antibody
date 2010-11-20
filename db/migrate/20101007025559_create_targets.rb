class CreateTargets < ActiveRecord::Migration
  def self.up
    create_table :targets do |t|
      t.string :name
      t.integer :species_id
      t.integer :antibodies_count, :default => 0
      t.integer :validations_count, :default => 0
      t.integer :project_targets_count, :default => 0
      t.integer :source_targets_count, :default => 0
      t.timestamps
    end
    add_index :targets, :species_id
    add_index :targets, :name
  end

  def self.down
    drop_table :targets
  end
end
