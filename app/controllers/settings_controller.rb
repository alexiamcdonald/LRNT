class SettingsController < ApplicationController
  def view
  	@topics_learn = %w(French English Spanish German Mandarin Japanese)
  	@topics_teach = %w(French English Spanish German Mandarin Japanese)
  end
end
