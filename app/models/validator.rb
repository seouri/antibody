class Validator < ActiveRecord::Base
  has_many :validator_targets
  has_many :targets, :through => :validator_targets
end
