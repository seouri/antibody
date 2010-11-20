class CreateValidations < ActiveRecord::Migration
  def self.up
    create_table :validations do |t|
      t.integer :antibody_id
      t.integer :validator_id
      t.string :category
      t.integer :species_id
      t.string :result
      t.string :notes
      t.string :conditions
      t.timestamps
    end
    add_index :validations, :antibody_id
  end

  def self.down
    drop_table :validations
  end
end
