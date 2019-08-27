require 'rails_helper'
describe User do
  describe '#create' do
	it "is valid with a nickname, email, password, over20, agree" do
	    user = build(:user)
      user.skip_confirmation!
      user.save!
	    expect(user).to be_valid
	end
    it "is invalid without a nickname" do
     user = build(:user, nickname: "")
     user.valid?
     expect(user.errors[:nickname]).to include("を入力してください。")
    end

    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください。")
    end
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください。")
    end
    it "is invalid without a over20" do
      user = build(:user, over20: "")
      user.valid?
      expect(user.errors[:over20]).to include("を入力してください。")
    end
    it "is invalid without a agree" do
      user = build(:user, agree: "")
      user.valid?
      expect(user.errors[:agree]).to include("を入力してください。")
    end
    describe 'password' do
    	it "全角" do
	      user = build(:user, password: "ｈｏｇｅHOGE７")
	      user.valid?
	      expect(user.errors[:password]).to include("パスワードの強度が不足しています。パスワードの長さは8〜70文字とし、大文字と小文字と数字をそれぞれ1文字以上含める必要があります。")
    	end

    	it "大文字なし" do
	      user = build(:user, password: "hogehoge7")
	      user.valid?
	      expect(user.errors[:password]).to include("パスワードの強度が不足しています。パスワードの長さは8〜70文字とし、大文字と小文字と数字をそれぞれ1文字以上含める必要があります。")
    	end

    	it "小文字なし" do
	      user = build(:user, password: "HOGEHOGE7")
	      user.valid?
	      expect(user.errors[:password]).to include("パスワードの強度が不足しています。パスワードの長さは8〜70文字とし、大文字と小文字と数字をそれぞれ1文字以上含める必要があります。")
    	end

    	it "数字なし" do
	      user = build(:user, password: "hogeHOGE")
	      user.valid?
	      expect(user.errors[:password]).to include("パスワードの強度が不足しています。パスワードの長さは8〜70文字とし、大文字と小文字と数字をそれぞれ1文字以上含める必要があります。")
    	end

    	it "７字" do
	      user = build(:user, password: "hogeHO7")
	      user.valid?
	      expect(user.errors[:password]).to include("パスワードの強度が不足しています。パスワードの長さは8〜70文字とし、大文字と小文字と数字をそれぞれ1文字以上含める必要があります。")
    	end

    	it "８字" do
	      user = build(:user, password: "hogeHOG7")
	      expect(user).to be_valid
    	end
    end
    describe "重複" do
    	it "email" do

    	end
    	it "nickname" do

    	end

    end
  end
end