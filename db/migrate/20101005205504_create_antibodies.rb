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
      t.integer :vendor_id
      t.string :catalogue_number
      t.string :lot_number
      t.string :url
      t.string :created_by
      t.timestamps
    end
  end

  def self.down
    drop_table :antibodies
  end
end
