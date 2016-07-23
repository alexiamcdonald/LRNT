class SettingsController < ApplicationController
  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params) do |o|
      o.user_id = current_user.id
    end
  end

  def show
  end
end
