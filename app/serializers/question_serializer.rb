class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :answers
  belongs_to :user

  def user
    UserSerializer.new(object.user).as_json
  end

  def answers
    object.answers.map { |answer| AnswerSerializer.new(answer) }.as_json
  end
end
