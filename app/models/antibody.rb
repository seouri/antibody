class Antibody < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  belongs_to :target, :counter_cache => true
  belongs_to :source, :counter_cache => true
  belongs_to :host_species, :class_name => 'Species'
  has_many :validations, :order => "category desc"
  #validates_uniqueness_of :lot_number, :scope => [:source_id, :catalogue_number]

  def source_with_catalogue_and_lot_number
    name = [self.source.name]
    name.push("catalogue #: #{self.catalogue_number}") if self.catalogue_number.present?
    name.push("lot #: #{self.lot_number}") if self.lot_number.present?
    name.join(", ")
  end
end
