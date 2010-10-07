class Target < ActiveRecord::Base
  belongs_to :species, :counter_cache => true
  has_many :antibodies
end
