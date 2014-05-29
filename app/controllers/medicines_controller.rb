class MedicinesController < ApplicationController
  before_filter :find_hospital
  before_filter :find_patient

  def new
    @medicine = Medicine.new
  end
  def create
    @medicine = @patient.medicines.create medicine_params
      success = @medicine.save
    if success == true
      flash[:notice] = "You entered a legal name"
    redirect_to hospital_patient_path(@hospital, @patient)
    else
      flash[:error] = "you need to enter a legal name"
      render :new
    end
  end

  private
     def find_patient
      @patient = Patient.find params[:patient_id]
    end

    def find_medicine
      @medicine = Medicine.find params[:id]
    end 

     def find_hospital
      @hospital = Hospital.find params[:hospital_id]
    end

    def medicine_params
      params.require(:medicine).permit(:name)
    end
end
