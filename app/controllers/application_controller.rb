class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!,  except: [:show, :index]

  def is_admin?
    current_user && current_user.admin?
  end

end
