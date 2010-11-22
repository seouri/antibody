class Species < ActiveRecord::Base
  has_many :targets, :order => "name", :include => [:species, :antibodies, {:validations => :species}]
  has_many :antibodies, :order => "name"
  has_many :validations

  def long_name
    "#{name} (#{scientific_name})"
  end
end
