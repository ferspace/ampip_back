# frozen_string_literal: true

class Api::V1::MunicipalitiesController < ApplicationController
  # GET '/municipalities'
  def index
    render json: Municipality.unscoped
  end

  # GET '/municipalities/:id'
  def show
    render json: Municipality.find(params[:id])
  end
end
