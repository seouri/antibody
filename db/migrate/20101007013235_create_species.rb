class CreateSpecies < ActiveRecord::Migration
  def self.up
    create_table :species do |t|
      t.string :name
      t.string :scientific_name
      t.integer :targets_count, :default => 0
      t.integer :antibodies_count, :default => 0
      t.timestamps
    end
    add_index :species, :name
    add_index :species, :scientific_name
  end

  def self.down
    drop_table :species
  end
end
