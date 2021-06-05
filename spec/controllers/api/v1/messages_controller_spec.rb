require 'rails_helper'

RSpec.describe Api::V1::MessagesController, "#create" do 
    context "message" do
        let(:user) {create(:user)}
        let(:user2) {create(:user)}
        before do
            Follow.create(user_id: user2.id,
                            following_id: user.id)
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            post :create, params: { id: user2.id, message: "mensaje"} 
        end
        it "should return HTTP success code" do
            expect(response).to have_http_status(:success)
        end
        it "should return message in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["message"])
        end
        
    end
    context "No message no follow" do
        let(:user) {create(:user)}
        let(:user2) {create(:user)}
        before do
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            post :create, params: { id: user2.id, message: "mensaje"} 
        end
        it "should return HTTP not found code" do
            expect(response).to have_http_status(404)
        end
        it "should return error in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["error"])
        end
        
    end
    context "No send message" do
        let(:user) {create(:user)}
        let(:user2) {create(:user)}
        before do
             Follow.create(user_id: user2.id,
                            following_id: user.id)
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            post :create, params: { id: user2.id} 
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
        let(:user2) {create(:user)}
        before do
            
            # request.headers["Username"] = user.email
            # request.headers["Password"] = user.authentication_token
            post :create, params: { id: user2.id, message: "mensaje"} 
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