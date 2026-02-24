require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model testing" do
     it { should validate_presence_of(:email) }
     before { create(:user) }
     it {should validate_uniqueness_of(:email)}
     it "check user active scop" do
      User.status('data')
     end
  end
end
