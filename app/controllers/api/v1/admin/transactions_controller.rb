# frozen_string_literal: true

module Api
  module V1
    module Admin
      class TransactionsController < ApplicationController
        before_action :set_transaction, only: %i[show update destroy]

        def index
          collection = scope.all
          render json: serialized_response(collection)
        end

        def show
          render json: serialized_response(transaction)
        end

        def create
          @transaction = scope.build(transaction_params)
          if transaction.save
            render json: serialized_response(transaction), status: :created
          else
            render json: serialized_response(transaction),
                   status: :unprocessable_entity
          end
        end

        def update
          if transaction.update(transaction_params)
            render json: serialized_response(transaction), status: :created
          else
            render json: serialized_response(transaction),
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

        def object_serializer
          TransactionSerializer
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
