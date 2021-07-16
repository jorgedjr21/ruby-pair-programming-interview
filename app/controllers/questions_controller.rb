class QuestionsController < ApplicationController

  def index
    render json: Question.eager_load(:user, answers: :user).where(is_private: false), status: :ok
  end
end
