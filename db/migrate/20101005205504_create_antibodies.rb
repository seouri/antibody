class CreateAntibodies < ActiveRecord::Migration
  def self.up
    create_table :antibodies do |t|
      t.string :name
      t.integer :target_id
      t.integer :host_species_id
      t.integer :source_id
      t.string :catalogue_number
      t.string :lot_number
      t.text :antigen
      t.string :clonality
      t.string :purification
      t.string :url
      t.integer :project_targets_count, :default => 0
      t.integer :project_antibodies_count, :default => 0
      t.integer :validations_count, :default => 0
      t.timestamps
    end
    add_index :antibodies, :target_id
    #add_index :antibodies, [:source_id, :catalogue_number, :lot_number], :unique => true, :name => "index_antibodies_on_source_catalogue_lot"
  end

  def self.down
    drop_table :antibodies
  end
end
