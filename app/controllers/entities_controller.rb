class EntitiesController < ApplicationController
  def index
    Patient.includes(:entity).each do |patient|
      puts patient.entity.name
    end
    render json: Entity.all
  end
end
