class CreateProjectTargets < ActiveRecord::Migration
  def self.up
    create_table :project_targets do |t|
      t.integer :project_id
      t.integer :target_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_targets
  end
end
