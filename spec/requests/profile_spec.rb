require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  context "When the user is signed in" do
    let(:user) { create(:user) }
    before do
        
        sign_in user
        post :create, params: {
            tsuit: {
                content: 'This is a UN test',
                user_id: user.id
            }
        }
    end

    it "should create a new tsuit" do
        expect(Profile.last.content).to eq('This is a UN test')
    end
end
  
end
