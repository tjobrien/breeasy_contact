class Product < ActiveRecord::Base
  scope :active, where(:active => true)
  scope :master, where(:master => true)
  scope :standard, where(:master => false)
end
