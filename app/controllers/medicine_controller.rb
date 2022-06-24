class MedicineController < ApplicationController
  def index
    render json: Medicine.all, status: 200
  end
end
