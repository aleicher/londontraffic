class Api::DisruptionsController < Api::ApplicationController
  def index
    disruptions = Disruption.all
    respond_with :api, :v1, disruptions
  end
end
