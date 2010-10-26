class SourceTarget < ActiveRecord::Base
  belongs_to :source, :counter_cache => true
  belongs_to :target, :counter_cache => true
end
