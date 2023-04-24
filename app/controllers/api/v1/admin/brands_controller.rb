# frozen_string_literal: true

module Api
  module V1
    module Admin
      class BrandsController < ApplicationController
        before_action :set_brand, only: %i[show update destroy]

        def index
          collection = Brand.all
          render json: parsed_response(object: collection)
        end

        def show
          render json: parsed_response
        end

        def create
          @brand = Brand.build(brand_params)
          if brand.save
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: brand.errors),
                   status: :unprocessable_entity
          end
        end

        def update
          if brand.update(brand_params)
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: brand.errors),
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

        def parsed_response(object: brand, errors: {},
                            options: {})
          BrandSerializer.new(
            object,
            options.merge!(errors)
          ).serializable_hash.to_json
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
