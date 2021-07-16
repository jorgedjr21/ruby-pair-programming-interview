class AnswerSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :body
end
