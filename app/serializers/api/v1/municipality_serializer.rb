# frozen_string_literal: true

class Api::V1::MunicipalitySerializer < Api::V1::ActiveModel::Serializer
  attributes :id, :name, :municipality_key, :zip_code, :state_id
end
