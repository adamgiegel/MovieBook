class MovieSerializer < ActiveModel::Serializer
  has_many :comments
  attributes :id, :title, :trailer, :starring, :info, :genre, :rating
end
