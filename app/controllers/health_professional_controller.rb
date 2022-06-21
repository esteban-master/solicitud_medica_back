class HealthProfessionalController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    all_health_professionals = HealthProfessional.select('health_professionals.id as id',
                                                         'professions.name as profession_name',
                                                         'health_professionals.*',
                                                         'entities.name').joins(:profession, :entity)
    all_health_professionals = all_health_professionals.where('professions.id = ?', params[:professionId]) unless params[:professionId].blank?
    render json: all_health_professionals, status: 200
  end

  def create
    new_professional = NewProfessionalOrPatientServices.new(params, 'professional')

    if new_professional[:error].nil?
      render json: new_professional, status: 200
    else
      render json: new_professional, status: 400
    end
  end

  def show
    uid = params[:id]
    professional = HealthProfessional.select('health_professionals.id as id',
           'professions.name as profession_name',
           'health_professionals.*',
           'entities.name').joins(:entity, :profession).where('entities.uid = ?', uid)
    render json: professional.last, status: 200
  end

  def patients_for_professional
    # medical_cares_patients = MedicalCare.where(health_professional_id: 70)
    #            .select('medical_cares.id as id',
    #                    'patients.id as patient_id',
    #                    'entities.name as patient_name',
    #                    'entities.tax_number as patient_tax_number',
    #                    'entities.address as patient_address',
    #                    'entities.phone as patient_phone',
    #                    'medical_cares.*')
    #            .joins(patient: :entity)
    #            .order(date: :desc)
    patients_ids = MedicalCare.where(health_professional_id: params[:professional_id]).pluck(:patient_id)

    render json: Entity.where(patient_id: patients_ids), status: 200
  end
end
