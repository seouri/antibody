class CreateVendors < ActiveRecord::Migration
  def self.up
    create_table :vendors do |t|
      t.string :name
      t.string :website
      t.string :contact_person
      t.string :contact_email
      t.string :contact_phone
      t.integer :antibodies_count, :default => 0
      t.timestamps
    end
    add_index :vendors, :name
    add_index :vendors, :antibodies_count
  end

  def self.down
    drop_table :vendors
  end
end
