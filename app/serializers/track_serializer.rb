class TrackSerializer < ActiveModel::Serializer
  attributes :id, :start_time, :end_time, :category
end
