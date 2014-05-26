class Hospital < ActiveRecord::Base
  validates :name, presence: true
  has_many :join_tables
  has_many :patients, through: :join_tables
  has_many :doctors, as: :treatable
end
