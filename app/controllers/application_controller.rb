class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


def after_sign_in_path_for(resource)
      current_user
        flash[:notice] = "ログインに成功しました。今日の記録を入力しましょう!"
        blogs_path  #　指定したいパス
end

def after_sign_out_path_for(resource)
    root_path
end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :age, :height])
  end

end
