class MedicalRecordController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    ActiveRecord::Base.transaction do
      medical_record = MedicalRecord.create(
        start_date: params[:startDate],
        end_date: params[:endDate],
        patient_id: params[:patientId],
        health_professional_id: params[:healthProfessionalId],
        observations: params[:observations]
      )

      params[:medicinesSelected].each do |item|
        MedicineLine.create(
          medical_record_id: medical_record.id,
          medicine_id: item[:id],
        )
      end
    end

    render json: true, status: 200
  end

end
