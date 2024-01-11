class ApplicationController < ActionController::Base
  before_action :set_theme

  private
  def set_theme
    cookies[:theme] ||= 'dark'
    cookies[:theme] = params[:theme] if params[:theme].in? %w[dark light]
  end
end
