require "rails_helper"

RSpec.describe "Questions Request", type: :request do
  let!(:questions) { create_list(:question, 5) }
  let!(:private_question) { create(:question, is_private: true) }
  let!(:public_question) { create(:question) }
  
  let!(:answer) { create(:answer, question: public_question) }
  let(:json_response) { JSON.parse(response.body) }
  
  describe "GET /questions" do
    subject { get '/questions', params: {}, headers: { 'Auth': api_key } }

    context 'with valid api_key' do
      let(:tenant) { create(:tenant) }
      let(:api_key) { tenant.api_key }

      it 'must count the tenant request' do
        expect { subject }.to change(TenantRequest, :count).by(1)
      end

      context "when questions exists" do
        it 'must have an :ok status' do
          subject
          
          expect(response).to have_http_status(:ok)
        end

        it 'should not include the private questions' do
          subject

          expect(json_response).to_not include(private_question.to_json)
        end

        it 'must have the public questions' do
          subject
          serialized_questions = questions.map { |question| QuestionSerializer.new(question).to_json }.first
          expect(json_response).to include(JSON.parse(serialized_questions))
        end

        it 'must have the question with the answer' do
          subject
          question = QuestionSerializer.new(public_question).to_json

          expect(json_response).to include(JSON.parse(question))
        end


        it 'must have the question name' do
          subject

          expect(json_response.first.keys).to include('title')
        end
      end
    end

    context 'with wrong api key' do
      let(:api_key) { 'wrong_api_key' }
  
      it 'must have an :unauthorized http status' do
        subject

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
