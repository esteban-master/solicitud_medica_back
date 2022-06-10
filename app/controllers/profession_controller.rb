class ProfessionController < ApplicationController
  def index
    render json: Profession.all, status: 200
  end
end
