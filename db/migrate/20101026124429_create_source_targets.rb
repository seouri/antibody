class CreateSourceTargets < ActiveRecord::Migration
  def self.up
    create_table :source_targets do |t|
      t.integer :source_id
      t.integer :target_id

      t.timestamps
    end
  end

  def self.down
    drop_table :source_targets
  end
end
