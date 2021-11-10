class PlansController < ApplicationController
  before_action :authenticate_user!

  def new
      current_user.sex.present? && current_user.age.present?
      # if current_user.plans.last.blank? || Date.today > current_user.plans.last.target_on
        @plan = Plan.new
        # gon.user = current_user
      if
        flash[:notice] = '目標を設定しました！'
        redirect_to plan_path(current_user)
     else
      flash[:notice] = '目標が設定されていません。'
      redirect_to edit_user_path(current_user)
     end
  end

  def edit
  end
end
