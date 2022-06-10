class MedicalCareController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render json: MedicalCare.all, status: 200
  end

  def create
    new_medical_care = MedicalCare.new(
      health_professional_id: params[:healthProfessionalId],
      patient_id: params[:patientId],
      date: params[:date],
      attended: false
    )
    new_medical_care.save
    render json: new_medical_care, status: 200
  end

  def medical_care_professional
    start_date = DateTime.parse(params[:startDate]).beginning_of_day
    end_date = DateTime.parse(params[:endDate]).end_of_day
    render json: MedicalCare.where(health_professional_id: params[:id], date: start_date..end_date), status: 200
  end
end
