class Validation < ActiveRecord::Base
  belongs_to :antibody, :counter_cache => true
  belongs_to :species
end
