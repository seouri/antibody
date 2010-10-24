class CreateProjectAntibodies < ActiveRecord::Migration
  def self.up
    create_table :project_antibodies do |t|
      t.integer :project_id
      t.integer :antibody_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_antibodies
  end
end
