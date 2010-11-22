class Image < ActiveRecord::Base
  belongs_to :validation, :dependent => :destroy
end
