class Target < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 20
  belongs_to :species, :counter_cache => true
  has_many :antibodies, :order => "name", :include => :source
  has_many :validations, :through => :antibodies
  has_many :project_targets
  has_many :projects, :through => :project_targets
  has_many :source_targets
  has_many :sources, :through => :source_targets

  def self.search(query, options = {})
    options[:conditions] = ["LOWER(#{Target.table_name}.name) LIKE ?", "#{query.downcase}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 20
    paginate options    
  end

  def name_with_species
    "#{name} (#{self.species.name})"
  end

  def name_with_species_and_counts
    a_count, v_count = self.antibodies_count, self.validations_count
    new_name = "#{name} (#{self.species.name})"
    new_name += ": #{a_count} #{(a_count == 0 or a_count > 1) ? "antibodies" : "antibody"}"
    new_name += " with #{v_count} #{(v_count == 0 or v_count > 1) ? "validations" : "validation"}"
    new_name
  end
end
