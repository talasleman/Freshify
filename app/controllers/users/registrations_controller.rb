# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |user|
      user.create_cart if user.persisted?
    end
  end
end
