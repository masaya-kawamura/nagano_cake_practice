class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path(resource)
    root_path #とりあえず仮
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path # ログアウト後に遷移するpathを設定
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :email,
      :postcode,
      :address,
      :phone_number,
      :is_valid
    ])
  end
end
