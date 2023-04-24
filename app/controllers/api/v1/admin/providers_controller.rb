# frozen_string_literal: true

module Api
  module V1
    module Admin
      class ProvidersController < ApplicationController
        before_action :set_provider,
                      only: %i[show update destroy products]

        def index
          collection = Provider.all
          render json: parsed_response(object: collection)
        end

        def show
          render json: parsed_response
        end

        def create
          @provider = Provider.build(provider_params)
          if provider.save
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: provider.errors),
                   status: :unprocessable_entity
          end
        end

        def update
          if provider.update(provider_params)
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: provider.errors),
                   status: :unprocessable_entity
          end
        end

        def products
          collection = provider.products
          render json: ProductSerializer.new(
            collection
          ).serializable_hash.as_json
        end

        def destroy
          provider.destroy
          head :ok
        end

        private

        attr_reader :provider

        def set_provider
          @provider = Provider.find(params[:id])
        end

        def parsed_response(object: provider, errors: {},
                            options: {})
          ProviderSerializer.new(
            object,
            options.merge!(errors)
          ).serializable_hash.to_json
        end

        def provider_params
          params.require(:provider).permit(
            %i[
              legal_name nickname first_name middle_name last_name
              maternal_last_name birth_date email phone website rfc
              curp nationality starts_on provider_type
            ]
          )
        end
      end
    end
  end
end
