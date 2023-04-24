# frozen_string_literal: true

module Api
  module V1
    module Admin
      class ProductsController < ApplicationController
        before_action :set_product, only: %i[show update destroy]

        def index
          collection = Product.all
          render json: serialized_response(collection)
        end

        def show
          render json: serialized_response(product)
        end

        def create
          @product = Product.build(product_params)
          if product.save
            render json: serialized_response(product), status: :created
          else
            render json: serialized_response(product),
                   status: :unprocessable_entity
          end
        end

        def update
          if product.update(product_params)
            render json: serialized_response(product), status: :created
          else
            render json: serialized_response(product),
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

        def object_serializer
          ProductSerializer
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
