# frozen_string_literal: true

module Api
  module V1
    module Admin
      class BrandsController < ApplicationController
        before_action :set_brand, only: %i[show update destroy]

        def index
          collection = Brand.all
          render json: serialized_response(collection)
        end

        def show
          render json: serialized_response(brand)
        end

        def create
          @brand = Brand.new(brand_params)
          if brand.save
            render json: serialized_response(brand), status: :created
          else
            render json: serialized_response(brand),
                   status: :unprocessable_entity
          end
        end

        def update
          if brand.update(brand_params)
            render json: serialized_response(brand), status: :created
          else
            render json: serialized_response(brand),
                   status: :unprocessable_entity
          end
        end

        def destroy
          brand.destroy
          head :ok
        end

        private

        attr_reader :brand

        def set_brand
          @brand = Brand.find(params[:id])
        end

        def object_serializer
          BrandSerializer
        end

        def brand_params
          params.require(:brand).permit(
            %i[
              name
            ]
          )
        end
      end
    end
  end
end
