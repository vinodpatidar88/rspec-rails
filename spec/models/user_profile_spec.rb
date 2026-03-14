require "rails_helper"

RSpec.describe UserProfile, type: :model do
    context "user profile assocation check" do
        it {should belong_to(:user)}
    end

    context "User Profile Validations" do
      let!(:user) { create(:user) }
      let!(:user_profile) { create(:user_profile, user: user) }
      it { should define_enum_for(:status).with_values(active: 0, inactive: 1, pending: 2)}
      it "testing assocaition" do
        expect(User.count).to eq(1)
        expect(UserProfile.count).to eq(1)
        # let(:user) { build(:user) } :- build is used to create a new object in memory without saving it to the database.
        # let(:user) {create(:user)} :- create user in database.
        # let runs only when the variable is called in the test. (lazy load)
        # let! before every example and created before the test runs. (eager load)
      end
    end
end