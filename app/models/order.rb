class Order < ActiveRecord::Base

  has_many :variations

end
