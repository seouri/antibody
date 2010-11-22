class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :validation_id
      t.string :filename
      t.string :description
      t.string :content_type
      t.binary :binary_data, :limit => 16.megabytes
    end
    add_index :images, :validation_id
  end

  def self.down
    drop_table :images
  end
end
