class QuestionsController < ApplicationController

  def index
    render json: Question.where(is_private: false), status: :ok
  end
end
