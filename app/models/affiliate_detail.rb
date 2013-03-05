class AffiliateDetail < ActiveRecord::Base
  belongs_to :user
  validates :last_name, :first_name, :company, :affiliate_code,  :presence => true
  validates :affiliate_code, :uniqueness => true, :length => { :minimum => 5, :maximum => 15}

end