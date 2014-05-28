class PatientsController < ApplicationController
  before_filter :find_hospital
  before_filter :find_patient, only:[:show,
    :edit,
    :update,
    :destroy,
    :doctor,
    :add_doctor,
    :new_doctor,
    :discharge]

  def index
    @patient = if params[:q]
      Patient.search_names params [:q]
    else
      Patient.all
    end
    respond_to do |format|
      format.js
    end
  end

  def new
    @patient = Patient.new 
    @hospitals = Hospital.all
  end

  def create
    @patient = Patient.create patient_params
    success = @patient.save
     if success == true
      flash[:notice] = "You entered an acceptable name"
      redirect_to hospital_path(@hospital)
    else
      flash[:error] = "you need to enter an acceptable name"
      render :new
    end
    
  end

  def show
    @doctor = @patient.doctors
    @medicine = @patient.medicines
  end

  def edit
  end

  def update
    @patient.update_attributes patient_params
    redirect_to hospital_path(@hospital)
  end

  def destroy
  end

  def new_doctor
    @doctor = @patient.doctors.new
    redirect_to doctor_hospital_path(@hospital)
  end

  def add_doctor
    @doctor = @patient.doctors.create doctor_params
    redirect_to hospital_patient_path(@hospital, @patient)
  end

  def doctor
    @patient = Patient.find params[:id]
    @patient.doctor!
    respond_to do |format|
      format.js
    end
  end

  def xrays
    @patient = Patient.find params[:id]
    @patient.xray!
    respond_to do |format|
      format.js
    end
  end

  def surgery
    @patient = Patient.find params[:id]
    @patient.surgery!
    respond_to do |format|
      format.js
    end
  end

  def paybill
    @patient = Patient.find params[:id]
    @patient.paybill!
    respond_to do |format|
      format.js
    end
  end

  def leaving
    @patient = Patient.find params[:id]
    @patient.leaving!
    respond_to do |format|
      format.js
    end
  end


  def search_names
    @patient = Patient.search_names params[:q]
  end

  def discharge
  end
  
  private
    def patient_params
      params.require(:patient).permit(:name,
        :address,
        :phone,
        :description,
        :hospital_id,
        :ad_info,
        {hospital_ids: []})
    end
    def doctor_params
      params.require(:doctor).permit(:name)
    end
    def find_hospital
      @hospital = Hospital.find params[:hospital_id]
    end
    def find_patient
      @patient = Patient.find params[:id]
    end
end
