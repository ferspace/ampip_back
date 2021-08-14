# frozen_string_literal: true

class Api::V1::ZipCodesController < ApplicationController
  # GET '/zip_codes'
  def index
    render json: ZipCode.search(params)
  end
end
