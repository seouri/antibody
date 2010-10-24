class ProjectTarget < ActiveRecord::Base
  belongs_to :project, :counter_cache => true
  belongs_to :target, :counter_cache => true
end
