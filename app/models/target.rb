class Target < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  belongs_to :species, :counter_cache => true
  has_many :antibodies, :order => "name"
end
