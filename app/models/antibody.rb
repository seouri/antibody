class Antibody < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 15
  belongs_to :vendor, :counter_cache => true
end
