class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


 def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "ログインに成功しました。今日の記録をしましょう!"
        blogs_path  #　指定したいパス
      else
        flash[:notice] = "新規登録完了しました。次に年齢・性別・身長を入力してください"
        edit_user_path  #　指定したいパス
      end
 end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end
