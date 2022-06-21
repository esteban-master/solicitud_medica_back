class PatientController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index

  end

  def create
    new_patient = NewProfessionalOrPatientServices.new(params, 'patient')
    if new_patient[:error].nil?
      render json: new_patient, status: 200
    else
      render json: new_patient, status: 400
    end
  end

  def show
    uid = params[:id]
    patient = Patient.select('patients.id as id', 'patients.*', 'entities.*')
                     .joins(:entity).where('entities.uid = ?', uid)
    render json: patient.last, status: 200
  end

end
