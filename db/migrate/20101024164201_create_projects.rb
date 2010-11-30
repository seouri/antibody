class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.text :journal
      t.integer :publication_year
      t.text :url
      t.integer :project_targets_count, :default => 0
      t.integer :project_antibodies_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
