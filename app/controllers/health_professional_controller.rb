class HealthProfessionalController < ApplicationController
  def index
    render json: HealthProfessional.all, status: 200
  end
end
