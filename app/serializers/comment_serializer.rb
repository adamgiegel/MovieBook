class CommentSerializer < ActiveModel::Serializer
  belongs_to :movie 
  belongs_to :user
  attributes :id, :comment, :movie_id, :user_id
end
