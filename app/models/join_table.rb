class JoinTable < ActiveRecord::Base
  belongs_to :hospital
  belongs_to :patient
end
