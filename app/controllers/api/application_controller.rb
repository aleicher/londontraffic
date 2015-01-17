class Api::ApplicationController < ActionController::Base
  # The API is json only
  respond_to :json
end
