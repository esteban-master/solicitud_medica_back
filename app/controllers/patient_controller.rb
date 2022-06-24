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

  def medical_records
    medical_records = MedicalRecord.where(patient_id: params[:patientId], health_professional_id: params[:professionalId])
                       .includes(medicine_lines: [:medicine]).map do |mr|
      {
        medicine_lines: mr.medicine_lines.map{|item| item.medicine},
        start_date: mr.start_date,
        end_date: mr.end_date,
        id: mr.id,
        observations: mr.observations,
        created_at: mr.created_at
      }
    end

    render json: {
      medical_records: medical_records,
      diseases: DiseasePatient.select('diseases.id as id', 'diseases.name as name').where(patient_id: params[:patientId]).joins(:disease),
      last_medical_record: medical_records.last,
      patient: Patient.find(params[:patientId]).entity
    }, status: 200
  end


  def account_request
    PatientMailer.with(data: { email: params[:email], tax_number: params[:tax_number], name: params[:name] }).account_request.deliver_now

    render json: {
      ok: true, message: 'Solicitud enviada con exito'
    }, status: 200
  end

end
