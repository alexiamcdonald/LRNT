class SettingsController < ApplicationController
  def new
    @setting = Setting.new
    @setting.user_id = current_user
  end

  def create
    @setting = Setting.new(setting_params) do |o|
      o.user_id = current_user.id
    end
  end

  def show
  end

  private

  def setting_params
    params.require(:setting).permit(
    :user_id,
    :location_id,
    :bio,
    :learn_one,
    :learn_two,
    :learn_three,
    :teach_one,
    :teach_two,
    :teach_three
    )
  end
end
