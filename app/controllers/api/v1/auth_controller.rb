module Api
  module V1
    class AuthController < ApplicationController
      def register
        user = User.new(user_params)
        if user.save
          token = encode_token(user_id: user.id)
          render json: { user: user, token: token }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def login
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
          token = encode_token(user_id: user.id)
          render json: { user: user, token: token }
        else
          render json: { error: 'Invalid credentials' }, status: :unauthorized
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end

      def encode_token(payload)
        JWT.encode(payload, Rails.application.secrets.secret_key_base)
      end
    end
  end
end
