require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  let(:valid_attributes) do
    {
      'tweet' => 'Test',
      'user_name' => 'test'
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'A',
      'tweet' => 'This is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN testThis is a UN test',
      'user_name' => 'none'
    }
  end
  
  describe "GET /create" do
    it 'renders a successful response' do
      profile = Profile.new(valid_attributes)
      profile.user_name = 'test'
      profile.save
      expect(response).to be_successful

    end
  end

end
