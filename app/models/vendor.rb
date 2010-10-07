class Vendor < ActiveRecord::Base
  has_many :antibodies, :include => [:target => :species]
end
