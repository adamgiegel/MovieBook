class MovieSerializer < ActiveModel::Serializer
  has_many :comments
  attributes :id, :title, :starring, :info, :genre, :rating
end
