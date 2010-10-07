class CreateTargets < ActiveRecord::Migration
  def self.up
    create_table :targets do |t|
      t.string :name
      t.integer :species_id
      t.integer :gene_id
      t.integer :antibodies_count, :default => 0

      t.timestamps
    end
    add_index :targets, :species_id
    add_index :targets, :gene_id
  end

  def self.down
    drop_table :targets
  end
end
