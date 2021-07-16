require "rails_helper"

RSpec.describe "Questions Request", type: :request do
  let!(:questions) { create_list(:question, 5) }
  let!(:private_question) { create(:question, is_private: true) }
  let!(:public_question) { create(:question) }

  let!(:answer) { create(:answer, question: public_question) }
  let(:json_response) { JSON.parse(response.body) }
  
  describe "GET /questions" do
    subject { get '/questions', params: {} }
    
    context "when questions exists" do
      it 'should not include the private questions' do
        subject

        expect(json_response).to_not include(private_question.to_json)
      end

      it 'should have the public questions' do
        subject
        serialized_questions = ActiveModel::SerializableResource.new(Question.where(is_private: false), each_serializer: QuestionSerializer)
        expect(json_response).to include(questions.as_json)
      end

      it 'should have the public question '

      it 'must have the question name' do
        subject

        expect(json_response.first.keys).to include('title')
      end

      it 'must have the answers of each question' do
        subject  
        p json_response
      end
    end
  end
end
