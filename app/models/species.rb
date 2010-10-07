class Species < ActiveRecord::Base
  has_many :targets
  has_many :antibodies

  def long_name
    "#{name} (#{scientific_name})"
  end
end
