require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "#index" do
    context 'as an authenticated user' do
      let(:user) { FactoryGirl.create(:user) }

      it 'responds successfully' do
        sign_in(user)
        get :index
        expect(response).to be_success
      end

      it "renders the index template" do
        sign_in(user)
        get :index
        expect(response).to render_template("index")
      end
    end
  end
end
