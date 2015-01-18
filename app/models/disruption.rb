class Disruption
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :status, type: String
  field :severity, type: String
  field :levelOfInterest, type: String
  field :category, type: String
  field :subCategory, type: String
  field :startTime, type: DateTime
  field :endTime, type: DateTime
  field :location, type: String
  field :comments, type: String
  field :currentUpdate, type: String
  field :remarkTime, type: DateTime
  field :lastModTime, type: DateTime

end
