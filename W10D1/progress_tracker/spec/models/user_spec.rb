require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6)}

  describe 'uniqueness' do
    before(:each) do
        create(:user)
    end
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:session_token) }
  end

  describe "#is_password?" do
    let(:user) { create(:user) }
    context "with valid password" do
        it "returns true" do
            expect(user.is_password?("hunter2")).to be(true)
        end
    end

    context "with invalid password" do
        it "returns false" do
            expect(user.is_password?("hunter3")).to be(false)
        end
    end
  end

  describe "::find_by_credentials" do
    let(:user) { create(:user) }
    context "with existing user" do
        it "returns the user" do
            expect(User.find_by_credentials(user.email, "hunter2")).to eq(user)
        end
    end

    context "with nonexistant user" do
        it "returns nil" do
            expect(User.find_by_credentials("user@user.com", "hunter2")).to be(nil)
        end
    end

    context "with existing user but invalid password" do
        it "returns nil" do
            expect(User.find_by_credentials(user.email, "hunter3")).to be(nil)
        end
    end
  end
end
