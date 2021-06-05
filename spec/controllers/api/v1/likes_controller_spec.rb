require 'rails_helper'

RSpec.describe Api::V1::LikesController, "#create" do 
	context "like" do
        let(:user) {create(:user)}
        let(:profile) {create(:profile )}
        before do
            # request.headers["Username"] = user.email
            # request.headers["Password"] = user.authentication_token
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            post :create, params: { id: profile.id} 
        end
        it "should return HTTP success code" do
            expect(response).to have_http_status(:success)
        end
        
    end
    context "dislike" do
        let(:user) {create(:user)}
        let(:profile) {create(:profile )}
        before do
            # request.headers["Username"] = user.email
            # request.headers["Password"] = user.authentication_token
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            post :create, params: { id: profile.id} 
            post :create, params: { id: profile.id} 
        end
        it "should return HTTP success code" do
            expect(response).to have_http_status(:success)
        end
        
    end
    context "profile no creado" do
        let(:user) {create(:user)}
        let(:profile) {create(:profile )}
        before do
            # request.headers["Username"] = user.email
            # request.headers["Password"] = user.authentication_token
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            post :create, params: { id: 100} 
        end
        it "should return HTTP success code" do
            expect(response).to have_http_status(400)
        end
        
    end
end