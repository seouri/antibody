class CreateSources < ActiveRecord::Migration
  def self.up
    create_table :sources do |t|
      t.string :name
      t.string :website
      t.string :contact_person
      t.string :contact_email
      t.string :contact_phone
      t.integer :antibodies_count, :default => 0
      t.integer :source_targets_count, :default => 0
      t.timestamps
    end
    add_index :sources, :name
    add_index :sources, :antibodies_count
  end

  def self.down
    drop_table :sources
  end
end
