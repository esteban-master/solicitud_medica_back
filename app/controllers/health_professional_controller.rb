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
end
