class Species < ActiveRecord::Base
  has_many :targets, :order => "name", :include => :species
  has_many :antibodies, :order => "name"

  def long_name
    "#{name} (#{scientific_name})"
  end
end
