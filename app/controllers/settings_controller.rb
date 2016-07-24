class SettingsController < ApplicationController
  before_action :find_setting, only: [:show, :edit]

  def new
    @setting = Setting.new
    @setting.user_id = current_user
  end

  def create
    @setting = Setting.new(setting_params) do |o|
      o.user_id = current_user.id
    end
    @setting.save!
    redirect_to setting_path(@setting.id), notice: "Profile created"
  end

  def show
  end

  private

  def find_setting
    @setting = Setting.find(params[:id])
  end

  def setting_params
    params.require(:setting).permit(
    :user_id,
    :picture,
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
