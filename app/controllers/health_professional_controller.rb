class HealthProfessionalController < ApplicationController
  def index
    all_health_professionals = HealthProfessional.select('health_professionals.id as id',
                                                         'professions.name as profession_name',
                                                         'health_professionals.*',
                                                         'entities.name').where('professions.id = ?', params[:id]).joins(:profession, :entity)
    render json: all_health_professionals, status: 200
  end
end
