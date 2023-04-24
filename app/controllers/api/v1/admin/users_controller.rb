# frozen_string_literal: true

module Api
  module V1
    module Admin
      class UsersController < ApplicationController
        before_action :set_user, only: %i[show update destroy]

        def index
          collection = User.all
          render json: parsed_response(object: collection)
        end

        def show
          render json: parsed_response
        end

        def create
          @user = User.build(user_params)
          if user.save
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: user.errors),
                   status: :unprocessable_entity
          end
        end

        def update
          if user.update(user_params)
            render json: parsed_response, status: :created
          else
            render json: parsed_response(errors: user.errors),
                   status: :unprocessable_entity
          end
        end

        def destroy
          user.destroy
          head :ok
        end

        private

        attr_reader :user

        def set_user
          @user = User.find(params[:id])
        end

        def parsed_response(object: user, errors: {},
                            options: {})
          UserSerializer.new(
            object,
            options.merge!(errors)
          ).serializable_hash.to_json
        end

        def user_params
          params.require(:user).permit(
            %i[
              first_name middle_name last_name maternal_last_name
              birth_date email phone gender rfc curp nationality
              role starts_on
            ]
          )
        end
      end
    end
  end
end
