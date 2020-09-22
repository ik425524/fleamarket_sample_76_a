require 'rails_helper'
describe Card do
  describe '#create' do

    it "user_idがなければ登録出来ないこと" do
      card = build(:card, user_id: nil)
      card.valid?
      expect(card.errors[:user_id]).to include("を入力してください")
    end
  
    it "customer_idがなければ登録出来ないこと" do
      card = build(:card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "card_idがなければ登録出来ないこと" do
      card = build(:card, card_id: nil)
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end
  end
end