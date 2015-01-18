class DisruptionRepository
  def disruptions
    Disruption.all
  end

  def disruption_for_id!(id)
    disruptions.find(id)
  end

  def disruption_for_id(id)
    disruptions.where(id: id).first
  end

  def disruption_for_tims_id(id)
    disruptions.where(timsid: id).first
  end

  def create_disruption(disruption_params)
    #replace the id 
    disruption_params["timsId"] = disruption_params.delete "id"
    disruption = Disruption.new(disruption_params)
    disruption.save
  end

  def create_disruptions(disruptions)
    disruptions.each do |d|
      create_disruption(d)
    end
  end

  def delete_all
    Disruption.destroy_all
  end

end
