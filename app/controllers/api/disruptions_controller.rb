class Api::DisruptionsController < Api::ApplicationController
  def index
    disruptions = disruption_repo.disruptions
    respond_with :api, :v1, disruptions
  end

  private

  def disruption_repo
    DisruptionRepository.new
  end
end
