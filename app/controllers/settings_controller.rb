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
    respond_to do |format|
      if @setting.save
        format.html { redirect_to @setting, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
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
