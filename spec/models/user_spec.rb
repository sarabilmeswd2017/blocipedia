require 'rails_helper'

RSpec.describe User, type: :model do
   let(:user) { User.create!(email: "user@bloccit.com", password: "password") }

   it { is_expected.to validate_presence_of(:email) }
   it { is_expected.to validate_uniqueness_of(:email) }
   it { is_expected.to validate_length_of(:email).is_at_least(3) }
   it { is_expected.to allow_value("user@bloccit.com").for(:email) }

   it { is_expected.to validate_presence_of(:password) }
   it { is_expected.to have_secure_password }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }

   describe "attributes" do
     it "should have email attribute" do
       expect(user).to have_attributes(email: user.email)
     end
end
