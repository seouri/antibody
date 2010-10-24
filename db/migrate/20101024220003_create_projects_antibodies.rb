class CreateProjectsAntibodies < ActiveRecord::Migration
  def self.up
    create_table :projects_antibodies do |t|
      t.integer :project_id
      t.integer :antibody_id
      t.timestamps
    end
  end

  def self.down
    drop_table :projects_antibodies
  end
end
