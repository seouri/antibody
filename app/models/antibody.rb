class Antibody < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 15
  belongs_to :target, :counter_cache => true
  belongs_to :vendor, :counter_cache => true
  belongs_to :host_species, :class_name => 'Species'
end
