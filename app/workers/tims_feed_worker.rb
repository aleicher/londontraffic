class TimsFeedWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence do
    # define interval here
    # see https://github.com/seejohnrun/ice_cube for syntax
    # or https://github.com/tobiassvn/sidetiq
    minutely
  end

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
