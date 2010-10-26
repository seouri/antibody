class Target < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10
  belongs_to :species, :counter_cache => true
  has_many :antibodies, :order => "name"
  has_many :project_targets
  has_many :projects, :through => :project_targets

  def self.search(query, options = {})
    options[:conditions] = ["#{Target.table_name}.name LIKE ?", "%#{query}%"] unless query.blank?
    options[:page]      ||= 1
    options[:per_page]  ||= 30
    options[:order] ||= "name"
    paginate options    
  end

  def name_with_species
    "#{name} (#{self.species.name})"
  end
end
