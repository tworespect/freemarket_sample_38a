require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with a name, email, password, password_confirmation' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a name" do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end
      it "is invalid without a email" do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      it "is invalid without a password" do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      it "is invalid without a password_confirmation" do
        user = build(:user, password_confirmation: nil)
        user.valid?
        expect(user.errors[:password_confirmation]).to include("can't be blank")
      end
      it "is invalid with a duplicate email address" do
        user = create(:user)
        another_user = build(:user)
        another_user.valid?
        expect(another_user.errors[:email]).to include("has already been taken")
      end
      it "is Invalid if it is 5 characters or less password" do
        user = build(:user, password: "12345", password_confirmation: "12345")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
      it "is Invalid if it is 129 characters or over password" do
        over = "a" * 129
        user = build(:user, password: over, password_confirmation: over)
        user.valid?
        expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
      end
      it "is Invalid if Including at least alphanumeric characters" do
        user = build(:user, password: "123456", password_confirmation: "123456")
        user.valid?
        expect(user.errors[:password]).to include("is invalid")
      end
      it "is invalid without a password_confirmation" do
        user = build(:user, password: "00000000",password_confirmation: "" )
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end
end
