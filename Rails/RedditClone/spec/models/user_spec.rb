require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "password encryption" do
    it "does not save passwords to the database" do
      User.create!(username: "jack_bruce", password: "abcdef")
      user = User.find_by_username("jack_bruce")
      expect(user.password).not_to be("abcdef")
    end

    it "encrypts the password using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "jack_bruce", password: "abcdef")
    end
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should have_many(:posts) }
end