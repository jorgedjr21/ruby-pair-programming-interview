require "rails_helper"

RSpec.describe "/questions", type: :routing do

  describe "GET /questions route" do
    
    it 'route to questions#index' do
      expect(get("/questions")).to route_to("questions#index")
    end
  end
end
