require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "POST #create" do
        # let(:user) { create(:user) }
        context 'with valid params' do
            it "creates a new user" do 
                post :create, params: { user: { email: "javier@javier.com", password: "password" } }
                expect(User.exists?(email: "javier@javier.com")).to be(true)
            end
        end

        context 'with invalid params' do 
            it 'fails to create new user' do 
                expect { post :create, params: { user: { email: "email@email.com", password: "" } } }.to raise_error
                # expect(User.exists?(email: "email@email.com")).to be(false)
                
            end 
        end 
    end
end
