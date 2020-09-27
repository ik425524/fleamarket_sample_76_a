require 'rails_helper'

describe Product do
  describe '#create' do

    context '商品を出品できる場合' do
      it 'brand以外の値が入っていれば出品できること' do
        expect(create(:product)).to be_valid
      end
    end
    
    context '商品を出品できない場合' do
      it 'nameが空なら出品NG' do
        product = build(:product, name: nil)
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end
    
      it 'descriptionが空なら出品NG' do
        product = build(:product, description: nil)
        product.valid?
        expect(product.errors[:description]).to include("can't be blank")
      end
    
      it 'priceが空なら出品NG' do
        product = build(:product, price: nil)
        product.valid?
        expect(product.errors[:price]).to include("can't be blank")
      end

      it "priceが300以下であれば登録できないこと " do
        product = build(:product, price: 299 )
        product.valid?
        expect(product.errors[:price]).to include("は300以上の値にしてください")
      end
    end
      
    
  end
end