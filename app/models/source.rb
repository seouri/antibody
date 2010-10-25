class Source < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  has_many :antibodies, :include => [:target => :species], :order => "name"
end
