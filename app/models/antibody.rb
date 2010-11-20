class Antibody < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  belongs_to :target, :counter_cache => true
  belongs_to :source, :counter_cache => true
  belongs_to :host_species, :class_name => 'Species'
  has_many :validations, :order => "category desc"
end
