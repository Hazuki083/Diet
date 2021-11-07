class PlansController < ApplicationController
  before_action :authenticate_user!

  def new
     if current_user.sex.present? && current_user.age.present?
      if current_user.plans.last.blank? || Date.today > current_user.plans.last.target_on
        @plan = Plan.new
        gon.user = current_user
      else
        flash[:notice] = 'ユーザー情報が更新されました。あなたの目標に変更はありませんか?'
        redirect_to plan_path(current_user.plans.last)
      end
     else
      flash[:notice] = 'ユーザー情報が足りません。身長や性別を教えてください!'
      redirect_to edit_user_path(current_user)
     end
  end

  def edit
  end
end
