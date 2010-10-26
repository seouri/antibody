class ValidatorTarget < ActiveRecord::Base
  belongs_to :validator, :counter_cache => true
  belongs_to :target
end
