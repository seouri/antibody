class Target < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  belongs_to :species, :counter_cache => true
  has_many :antibodies, :order => "name"
  has_many :project_targets
  has_many :projects, :through => :project_targets
end
