require 'rails_helper'

RSpec.describe Api::V1::HashtagController, "#index" do 
	context "hashtag" do
        let(:user) {create(:user)}
        let(:profile) {create(:profile )}
        before do
            # request.headers["Username"] = user.email
            # request.headers["Password"] = user.authentication_token
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            get :index, params: {hashtag: "#ok"} 
        end
        it "should return HTTP success code" do
            expect(response).to have_http_status(:success)
        end
        it "should return Tweets in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["tweets"])
        end
    end
    context "hashtag no encontrado" do
        let(:user) {create(:user)}
        let(:profile) {create(:profile)}
        before do
            # request.headers["Username"] = user.email
            # request.headers["Password"] = user.authentication_token
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            get :index, params: {hashtag: "#asd"} 
        end
        it "should return HTTP success code" do
            expect(response).to have_http_status(:success)
        end
        it "should return Tweets in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["tweets"])
        end
        
    end
    context "no hg" do
        let(:user) {create(:user)}
        let(:profile) {create(:profile )}
        before do
            # request.headers["Username"] = user.email
            # request.headers["Password"] = user.authentication_token
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            get :index, params: {hashtag: "ok"} 
        end
        it "should return HTTP not found code" do
            expect(response).to have_http_status(404)
        end
        it "should return error in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["error"])
        end
        
    end
    context "user no logeado" do
        let(:user) {create(:user)}
        let(:profile) {create(:profile )}
        before do
            # request.headers["Username"] = user.email
            # request.headers["Password"] = user.authentication_token
          
            get :index, params: {hashtag: "#ok"} 
        end
        it "should return HTTP not found code" do
            expect(response).to have_http_status(404)
        end
        it "should return error in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["error"])
        end
        
    end
   
end