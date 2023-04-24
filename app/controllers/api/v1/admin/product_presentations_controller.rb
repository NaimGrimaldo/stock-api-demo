# frozen_string_literal: true

module Api
  module V1
    module Admin
      class ProductPresentationsController < ApplicationController
        before_action :set_product_presentation, only: %i[show update destroy]

        def index
          collection = ProductPresentation.all
          render json: parsed_response(object: collection)
        end

        def show
          render json: parsed_response
        end

        def create
          @product_presentation = ProductPresentation.build(
            product_presentation_params
          )
          if product_presentation.save
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: product_presentation.errors),
                   status: :unprocessable_entity
          end
        end

        def update
          if product_presentation.update(product_presentation_params)
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: product_presentation.errors),
                   status: :unprocessable_entity
          end
        end

        def destroy
          product_presentation.destroy
          head :ok
        end

        private

        attr_reader :product_presentation

        def set_product_presentation
          @product_presentation = ProductPresentation.find(params[:id])
        end

        def parsed_response(object: product_presentation, errors: {},
                            options: {})
          ProductPresentationSerializer.new(
            object,
            options.merge!(errors)
          ).serializable_hash.to_json
        end

        def product_presentation_params
          params.require(:product_presentation).permit(
            %i[
              name description factor_per_item nickname
            ]
          )
        end
      end
    end
  end
end
