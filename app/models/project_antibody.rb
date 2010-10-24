class ProjectAntibody < ActiveRecord::Base
  belongs_to :project, :counter_cache => true
  belongs_to :antibody, :counter_cache => true
end
