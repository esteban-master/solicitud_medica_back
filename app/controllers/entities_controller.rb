class EntitiesController < ApplicationController
  def index
    all_entities = Entity.all
    render json: all_entities, status: 200
  end

  def show
    entity_id = params[:id]
    render json: Entity.find(entity_id), status: 200
  end
end
