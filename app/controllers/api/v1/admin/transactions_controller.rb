# frozen_string_literal: true

module Api
  module V1
    module Admin
      class TransactionsController < ApplicationController
        before_action :set_transaction, only: %i[show update destroy]

        def index
          collection = scope.all
          render json: parsed_response(object: collection)
        end

        def show
          render json: parsed_response
        end

        def create
          @transaction = scope.build(transaction_params)
          if transaction.save
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: transaction.errors),
                   status: :unprocessable_entity
          end
        end

        def update
          if transaction.update(transaction_params)
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: transaction.errors),
                   status: :unprocessable_entity
          end
        end

        def destroy
          transaction.destroy
          head :ok
        end

        private

        attr_reader :transaction

        def set_transaction
          @transaction = scope.find(params[:id])
        end

        def scope
          if current_resource
            current_resource.transactions
          else
            Transaction
          end
        end

        def parsed_response(object: transaction, errors: {}, options: {})
          TransactionSerializer.new(
            object,
            options.merge!(meta: { errors: errors.full_messages.as_json })
          ).serializable_hash.to_json
        end

        def transaction_params
          params.require(:transaction).permit(
            %i[
              owner_type
              owner_id
              user_id
              transaction_type
              status
              product_id
              quantity
            ]
          )
        end
      end
    end
  end
end
