class CreateAntibodies < ActiveRecord::Migration
  def self.up
    create_table :antibodies do |t|
      t.string :name
      t.text :description
      t.integer :target_id
      t.integer :host_species_id
      t.text :antigen
      t.string :clonality
      t.string :purification
      t.integer :source_id
      t.string :catalogue_number
      t.string :lot_number
      t.string :url
      t.string :created_by
      t.integer :project_targets_count, :default => 0
      t.integer :project_antibodies_count, :default => 0
      t.integer :validations_count, :default => 0
      t.timestamps
    end
    add_index :antibodies, :target_id
  end

  def self.down
    remove_index :antibodies, :target_id
    drop_table :antibodies
  end
end
