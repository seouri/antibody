class CreateAntibodies < ActiveRecord::Migration
  def self.up
    create_table :antibodies do |t|
      t.string :name
      t.text :description
      t.string :target_species
      t.string :target_name
      t.string :target_gene_product
      t.string :host_species
      t.text :antigen
      t.string :clonality
      t.string :purification
      t.string :vendor
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
