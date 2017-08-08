class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
  #
  def ensure_approved
    current_user && current_user.approved
  end
end
