# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        status: { code: 200, message: 'Signed up successfully', data: resource}
      }
    else 
      render json: {
        status: {
          message: "User could not sign up successfully",
          error: resource.errors.full_messages 
        },
         status: :unprocessable_entity
        
      }
  end
end
end