require 'rails_helper'
RSpec.describe Api::V1::LikesController, "#index" do
    context "like" do
        let(:user) {create(:user)}
        let(:profile) {create(:profile )}
        before do
            request.headers["Authorization"] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.authentication_token)
            get :index, params: { id: profile.id} 
        end
        it "should return HTTP success code" do
            expect(response).to have_http_status(:success)
        end
        it "should return likes in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["likes"])
        end
    end

end 


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
        it "should return ok in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["ok"])
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
        it "should return ok in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["ok"])
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
        it "should return HTTP not found code" do
            expect(response).to have_http_status(404)
        end
        it "should return error in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to  match_array(["error"])
        end
    end
end