class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    edit_individual_url(current_user.iteasykit_individual)
  end
end