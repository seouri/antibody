class Source < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  has_many :antibodies, :include => [:target => :species], :order => "name"
  has_many :source_targets
  has_many :targets, :through => :source_targets
end
