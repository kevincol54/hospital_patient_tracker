class HospitalsController < ApplicationController
  before_filter :find_hospital, only:[:show,
    :edit,
    :update,
    :destroy,
    :doctor,
    :add_doctor]
  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.create hospital_params
    success = @hospital.save
    if success == true
      flash[:notice] = "You entered an acceptable name"
      redirect_to root_path
    else
      flash[:error] = "you need to enter an acceptable name"
      render :new
    end
  end

  def show
    @patients = @hospital.patients
    @doctors = @hospital.doctors
    @patient = @hospital.patients.where.not(workflow_state: "leaving")
    @patient_leaving = @hospital.patients.where(workflow_state: "leaving")
  end

  def update
    @hospital.update_attributes hospital_params
    redirect_to root_path
  end

  def doctor
    @doctor = @hospital.doctors.new
  end

  def add_doctor
    @doctor = @hospital.doctors.create doctor_params
    redirect_to hospital_path(@hospital)
  end

  private
  def hospital_params
    params.require(:hospital).permit(:name, :address)
  end

  def find_hospital
    @hospital = Hospital.find params[:id]
  end
  
  def doctor_params
    params.require(:doctor).permit(:name)
  end
end
