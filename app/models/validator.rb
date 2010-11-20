class Validator < ActiveRecord::Base
  has_many :validator_targets
  has_many :targets, :through => :validator_targets, :include => [:species, :antibodies, :validations]
  has_many :validations, :include => :species
end
