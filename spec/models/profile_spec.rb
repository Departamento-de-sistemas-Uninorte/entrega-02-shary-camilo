require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'validation test' do
    it 'ensures user author' do
      profile = Profile.new(tweet: 'This a UN testThis a UN testThis a UN testThis a UN test').save
      expect(profile).to eq(false)
    end
    it 'ensures content tweet' do
      profile = Profile.new(user_name: 'sharybustos').save
      expect(profile).to eq(false)
    end
    it 'ensures tweet length' do
      profile = Profile.new(user_name: 'sharybustos', tweet: 'This a UN testThis a UN testThis a UN testThis a UN test
        This a UN testThis a UN testThis a UN testThis a UN test
        This a UN testThis a UN testThis a UN testThis a UN test
        This a UN testThis a UN testThis a UN testThis a UN test
        This a UN testThis a UN testThis a UN testThis a UN test').save
      expect(profile).to eq(false)
    end
    it 'should save successfully' do
      profile = Profile.new(user_name: 'sharybustos', tweet: 'This a UN testThis a UN testThis a UN testThis a UN test').save
      expect(profile).to eq(true)
    end
  end
  describe "association test" do
    it { should belong_to(:user).optional}
  end
end