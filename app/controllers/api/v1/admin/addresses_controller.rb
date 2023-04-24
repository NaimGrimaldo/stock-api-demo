# frozen_string_literal: true

module Api
  module V1
    module Admin
      class AddressesController < ApplicationController
        before_action :set_address, only: %i[show update destroy]

        def index
          collection = scope.all
          render json: serialized_response(collection)
        end

        def show
          render json: serialized_response(address)
        end

        def create
          @address = scope.build(address_params)
          if address.save
            render json: serialized_response(address), status: :created
          else
            render json: serialized_response(address),
                   status: :unprocessable_entity
          end
        end

        def update
          if address.update(address_params)
            render json: serialized_response(address), status: :created
          else
            render json: serialized_response(address),
                   status: :unprocessable_entity
          end
        end

        def destroy
          address.destroy
          head :ok
        end

        private

        attr_reader :address

        def set_address
          @address = Address.find(params[:id])
        end

        def scope
          if current_resource
            current_resource.addresses
          else
            Address
          end
        end

        def object_serializer
          AddressSerializer
        end

        def address_params
          params.require(:address).permit(
            %i[
              owner_type owner_id street exterior_number interior_number
              neighborhood starts_on municipality city state zip_code country
            ]
          )
        end
      end
    end
  end
end
