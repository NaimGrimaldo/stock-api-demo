# frozen_string_literal: true

module Api
  module V1
    module Admin
      class ProductPresentationsController < ApplicationController
        before_action :set_product_presentation, only: %i[show update destroy]

        def index
          collection = ProductPresentation.all
          render json: serialized_response(collection)
        end

        def show
          render json: serialized_response(product_presentation)
        end

        def create
          @product_presentation = ProductPresentation.build(
            product_presentation_params
          )
          if product_presentation.save
            render json: serialized_response(product_presentation),
                   status: :created
          else
            render json: serialized_response(product_presentation),
                   status: :unprocessable_entity
          end
        end

        def update
          if product_presentation.update(product_presentation_params)
            render json: serialized_response(product_presentation),
                   status: :created
          else
            render json: serialized_response(product_presentation),
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

        def object_serializer
          ProductPresentationSerializer
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
