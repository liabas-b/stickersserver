class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_header_token

  def set_header_token
    response.headers["access_token"]="azertyuiop"
  end
end
