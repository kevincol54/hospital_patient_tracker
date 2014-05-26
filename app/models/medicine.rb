class Medicine < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :patient
end
