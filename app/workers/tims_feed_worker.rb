class TimsFeedWorker
  include Sidekiq::Worker

  def perform
    data = TflApi::Tims.feed
    if !data.disruptions.nil?
      disruption_repo.delete_all
      disruption_repo.create_disruptions(data.disruptions)
    end
  end

  private
  def disruption_repo
    DisruptionRepository.new
  end
end
