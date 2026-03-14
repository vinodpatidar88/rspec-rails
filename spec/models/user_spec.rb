require 'rails_helper'

RSpec.describe User, type: :model do
  describe "email validation when mobile is blank" do
      subject { build(:user, :mobile_blank) }

      it { should validate_presence_of(:email) }
  end

  describe "user model testing" do
     subject { create(:user)}
     it { should validate_numericality_of(:age) }
     it { should define_enum_for(:status).with_values(active: 0, inactive: 1, pending: 2)}
     it { should validate_presence_of(:password) }
     it { should validate_length_of(:password).is_at_least(3).is_at_most(50) }

    describe ".with_status" do
       it "return users with given status" do
        active = create(:user, status: 'active')
        inactive = create(:user, status: 'inactive')
        pending = create(:user, status: 'pending')
        expect(User.where(status: 'active')).to include(active)
        expect(User.where(status: 'inactive')).to include(inactive)
        expect(User.where(status: 'pending')).to include(pending)
       end
    end

    describe "custom validation mobile number" do
      it "invalid mobile number case" do
         user = User.new(email: 'dfnvjf@gmail.com', password: 'tsdhfghsdf')
         expect(user.validate).to be false
      end

      it "valid mobile number case" do
         user = User.new(mobile_number: '8827841281', email: 'vinodsdfghv@gmail.com', password: 'tsdhfghsdf')
         expect(user.validate).to be true
      end
    end

    describe "all type assocaition test" do
      it {should have_many(:user_profiles)}
    end
  end
end
