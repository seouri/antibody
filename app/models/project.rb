class Project < ActiveRecord::Base
  has_many :project_targets
  has_many :targets, :through => :project_targets, :include => [:species, :antibodies, :validations => :species]
  has_many :project_antibodies
  has_many :antibodies, :through => :project_antibodies
end
