class CreateValidations < ActiveRecord::Migration
  def self.up
    create_table :validations do |t|
      t.integer :target_id
      t.integer :antibody_id
      t.integer :validator_id
      t.string :category
      t.integer :species_id
      t.boolean :passed, :default => false
      t.string :notes
      t.string :conditions
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
    add_index :validations, :target_id
    add_index :validations, :antibody_id
    add_index :validations, :validator_id
    add_index :validations, :category
  end

  def self.down
    drop_table :validations
  end
end
