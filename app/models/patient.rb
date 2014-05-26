class Patient < ActiveRecord::Base
  validates :name, presence: true
  has_many :join_tables
  has_many :hospitals, through: :join_tables
  has_many :doctors, as: :treatable
  has_many :medicines
  scope :search_names, -> search {where( "name like ?", "%#{search}%") }
  before_create :send_patient_email

  def send_patient_email
    # PatientMailer.new_patient_email(self).deliver
  end
    
  include Workflow
  workflow do 
    state :waiting do
      event :doctor, transitions_to: :doctor
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :leaving, transitions_to: :leaving
    end

    state :doctor do
      event :doctor, transitions_to: :doctor
      event :xray, transitions_to: :xray
      event :surgery, transitions_to: :surgery
      event :paybill, transitions_to: :paybill
    end

    state :xray do
      event :surgery, transitions_to: :surgery
      event :doctor, transitions_to: :doctor
      event :paybill, transitions_to: :paybill
    end

    state :surgery do
      event :doctor, transitions_to: :doctor
      event :xray, transitions_to: :xray
      event :paybill, transitions_to: :paybill
    end

    state :paybill do
      event :leaving, transitions_to: :leaving
    end

    state :leaving 
  end
end


