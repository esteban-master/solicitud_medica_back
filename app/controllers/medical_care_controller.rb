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
    render json: MedicalCare.where(health_professional_id: params[:id], date: start_date..end_date, canceled: false), status: 200
  end

  def next_medical_care
    date = DateTime.parse(params[:date])
    next_medical_care = MedicalCare.where("date > ? AND attended = ? AND canceled = ?", date, false, false)

    if params[:patientId]
      next_medical_care = next_medical_care.where(patient_id: params[:patientId]).last
    else
      next_medical_care = next_medical_care.where(health_professional_id: params[:healthProfessionalId]).last
    end
    render json: next_medical_care, status: 200
  end

  def canceled_medical_care
    medical_care = MedicalCare.find(params[:id])
    medical_care.canceled = true
    medical_care.save
    render json: medical_care, status: 200
  end
end
