class Validation < ActiveRecord::Base
  belongs_to :antibody, :counter_cache => true
  belongs_to :species
  belongs_to :validator, :counter_cache => true
  belongs_to :target, :counter_cache => true
end
