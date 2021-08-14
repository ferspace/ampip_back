# frozen_string_literal: true

class Api::V1::StateSerializer < Api::V1::ActiveModel::Serializer
  attributes :id, :name, :cities_count
end
