class Restaurant < ActiveRecord::Base
  validates :code_id, :uniqueness => true 
end
