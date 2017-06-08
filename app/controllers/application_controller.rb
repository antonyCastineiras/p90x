class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def lowercase_and_underscore(s)
  	s.parameterize.underscore
  end
end
