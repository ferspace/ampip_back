# frozen_string_literal: true

class Api::V1::CitiesController < ApplicationController
  # GET '/cities'
  def index
    render json: City.unscoped
  end

  # GET '/cities/:id'
  def show
    render json: City.find(params[:id])
  end
end
