# frozen_string_literal: true

module Api
  module V1
    module Admin
      class BaseMeasurementUnitsController < ApplicationController
        before_action :set_base_measurement_unit, only: %i[show update destroy]

        def index
          collection = BaseMeasurementUnit.all
          render json: serialized_response(collection)
        end

        def show
          render json: serialized_response(base_measurement_unit)
        end

        def create
          @base_measurement_unit = BaseMeasurementUnit.new(
            base_measurement_unit_params
          )
          if base_measurement_unit.save
            render json: serialized_response(base_measurement_unit),
                   status: :created
          else
            render json: serialized_response(base_measurement_unit),
                   status: :unprocessable_entity
          end
        end

        def update
          if base_measurement_unit.update(base_measurement_unit_params)
            render json: serialized_response(base_measurement_unit),
                   status: :created
          else
            render json: serialized_response(base_measurement_unit),
                   status: :unprocessable_entity
          end
        end

        def destroy
          base_measurement_unit.destroy
          head :ok
        end

        private

        attr_reader :base_measurement_unit

        def set_base_measurement_unit
          @base_measurement_unit = BaseMeasurementUnit.find(params[:id])
        end

        def object_serializer
          BaseMeasurementUnitSerializer
        end

        def base_measurement_unit_params
          params.require(:base_measurement_unit).permit(
            %i[
              name description
            ]
          )
        end
      end
    end
  end
end
