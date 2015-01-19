class Api::DisruptionsController < Api::ApplicationController
  def index
    disruptions = disruption_repo.disruptions
    respond_with :api, :v1, disruptions
  end

  def show
    disruption = disruption_repo.disruption_for_id!(params[:id])
    respond_with :api, :v1, disruption
  end

  private

  def disruption_repo
    DisruptionRepository.new
  end
end
