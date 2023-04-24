# frozen_string_literal: true

module Api
  module V1
    module Admin
      class ProductsController < ApplicationController
        before_action :set_product, only: %i[show update destroy]

        def index
          collection = Product.all
          render json: parsed_response(object: collection)
        end

        def show
          render json: parsed_response
        end

        def create
          @product = Product.build(product_params)
          if product.save
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: product.errors),
                   status: :unprocessable_entity
          end
        end

        def update
          if product.update(product_params)
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: product.errors),
                   status: :unprocessable_entity
          end
        end

        def destroy
          product.destroy
          head :ok
        end

        private

        attr_reader :product

        def set_product
          @product = Product.find(params[:id])
        end

        def parsed_response(object: product, errors: {},
                            options: {})
          ProductSerializer.new(
            object,
            options.merge!(errors)
          ).serializable_hash.to_json
        end

        def product_params
          params.require(:product).permit(
            %i[
              name
              description
              internal_id
              purchase_price
              sale_price
              brand_id
              stock_quantity
              min_stock_quantity
              max_stock_quantity
              status
            ]
          )
        end
      end
    end
  end
end
