require 'rails_helper'
describe Purchaser do
  describe '#create' do

    it "user_idがなければ登録出来ないこと" do
      purchaser = build(:purchaser, user_id: nil)
      purchaser.valid?
      expect(purchaser.errors[:user_id]).to include("を入力してください")
    end
  
    it "customer_idがなければ登録出来ないこと" do
      purchaser = build(:purchaser, product_id: nil)
      purchaser.valid?
      expect(purchaser.errors[:product_id]).to include("を入力してください")
    end
    
  end
end