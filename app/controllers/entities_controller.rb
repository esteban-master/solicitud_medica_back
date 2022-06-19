class EntitiesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    all_entities = Entity.all
    render json: all_entities, status: 200
  end

  def show
    entity_id = params[:id]
    entity = Entity.where(uid: entity_id).includes(:patient, :health_professional).map do |entity|
      if entity.patient_id.nil?
        { entity: entity, info: entity.health_professional }
      else
        { entity: entity, info: entity.patient }
      end
    end.last
    render json: entity, status: 200
  end
end
