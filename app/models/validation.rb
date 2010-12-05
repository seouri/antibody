class Validation < ActiveRecord::Base
  belongs_to :antibody, :counter_cache => true
  belongs_to :species
  belongs_to :validator, :counter_cache => true
  belongs_to :target, :counter_cache => true
  has_many :images
  validates_presence_of :target_id, :antibody_id, :category #, :validator_id
  has_attached_file :image

  def result
    self.passed? ? "Passed" : self.passed.nil? ? "" : "Failed"
  end
end
