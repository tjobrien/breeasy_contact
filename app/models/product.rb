class Product < ActiveRecord::Base
  scope :active, where(:active => true)
end
