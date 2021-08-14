# frozen_string_literal: true

class Api::V1::CitySerializer < Api::V1::ActiveModel::Serializer
  attributes :id, :name, :state_id
end
