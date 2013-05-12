class SubmitDataset < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :institution, :description
  validates :email,  :presence => true
  validates :firstname,  :presence => true
  validates :lastname,  :presence => true
  validates :institution,  :presence => true
  validates :description,  :presence => true
end