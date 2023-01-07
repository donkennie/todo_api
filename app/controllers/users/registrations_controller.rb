# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    resource.save
    render_resource(resource)
end

private

    def sign_up_params
        params.require(:user).permit(:email, :password, :firstname, :lastname)
    end

#   private

#   def respond_with(resource, options={})
#     if resource.persisted?
#       render json: {
#         status: { code: 200, message: 'Signed up successfully', data: resource}
#       }
#     else 
#       render json: {
#         status: {
#           message: "User could not sign up successfully",
#           error: resource.errors.full_messages 
#         },
#          status: :unprocessable_entity
        
#       }
#   end
# end
end