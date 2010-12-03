class Source < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  has_many :antibodies, :include => [:target => :species], :order => "name"
  has_many :source_targets
  has_many :targets, :through => :source_targets, :include => [:species, :antibodies, {:validations => :species}]

  scope :most_antibodies, order("antibodies_count desc")
end
