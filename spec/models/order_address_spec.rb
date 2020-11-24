require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe OrderAddress do
    before do 
      @order_address = FactoryBot.build(:order_address)
    end

    describe '商品購入' do
      context '商品購入がうまくいく場合' do
        it 'postal_code, prefectula_id, city, house_number, phone_number, tokenが存在すれば有効' do
          expect(@order_address).to be_valid
        end
      end

      context '商品購入がうまく行かない場合' do
        it '郵便番号が空欄だと無効' do
          @order_address.postal_code = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('郵便番号を入力してください')
        end

        it '郵便番号にハイフンがなければ無効' do
          @order_address.postal_code = '1111111'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('郵便番号は不正な値です')
        end

        it '郵便番号が7桁以外だと無効' do
          @order_address.postal_code = '111-111'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('郵便番号は不正な値です')
        end

        it '都道府県が0だと無効' do
          @order_address.prefectual_id = 0
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('都道府県は0以外の値にしてください')
        end

        it '市区町村が空欄だと無効' do
          @order_address.city = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('市区町村を入力してください')
        end

        it '市区町村に英語が含まれると無効' do
          @order_address.city = 'aaaa'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('市区町村は不正な値です')
        end

        it '市区町村に数字含まれていると無効' do
          @order_address.city = 1233
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('市区町村は不正な値です')
        end

        it '市区町村にカタカナが含まれていると無効' do
          @order_address.city = "アイウエオ"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('市区町村は不正な値です')
        end

        it '番地が空だと無効' do
          @order_address.house_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('番地を入力してください')
        end

        it '電話番号が空だと無効' do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('電話番号を入力してください')
        end

        it '電話番号が10桁未満だと無効' do
          @order_address.phone_number = 12345
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
        end

        it '電話番号が11桁以上だと無効' do
          @order_address.phone_number = 12345678912345
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('電話番号は不正な値です')
        end

        it 'tokenが空だと無効' do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('クレジットカード情報を入力してください')
        end
      end
    end
  end
end
