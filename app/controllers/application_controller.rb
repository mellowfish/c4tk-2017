class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def per
    params[:per] || 20
  end

  def page
    params[:page] || 1
  end
end
