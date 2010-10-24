class Project < ActiveRecord::Base
  has_many :project_targets
  has_many :targets, :through => :project_targets
end
