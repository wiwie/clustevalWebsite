class Repository < ActiveRecord::Base
	belongs_to :repository
	belongs_to :repository_type
  # attr_accessible :title, :body
end
