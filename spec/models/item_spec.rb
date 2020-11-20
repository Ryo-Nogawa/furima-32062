require 'rails_helper'

RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品' do
      context '出品がうまくいく場合' do
        it 'title, detail, category_id, item_condition_id, item_cost_id, delivery_area_id, delivery_date_id, price, が存在すれば有効' do
          expect(@item).to be_valid
        end
      end

      context '出品がうまく行かない場合' do
        it '画像がないと無効' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('出品画像を入力してください')
        end

        it '商品名が空欄だと無効' do
          @item.title = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('商品名を入力してください')
        end

        it '商品名が40文字以上だと無効' do
          @item.title = ('a' * 50)
          @item.valid?
          expect(@item.errors.full_messages).to include('商品名は40文字以内で入力してください')
        end

        it '商品の説明が空欄だと無効' do
          @item.detail = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('商品の説明を入力してください')
        end

        it '商品の説明が1000文字以上だと無効' do
          @item.detail = ('a' * 1200)
          @item.valid?
          expect(@item.errors.full_messages).to include('商品の説明は1000文字以内で入力してください')
        end

        it 'カテゴリーが1だと無効' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
        end

        it '商品の状態が1だと無効' do
          @item.item_condition_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
        end

        it '配送料の負担が1だと無効' do
          @item.item_cost_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
        end

        it '配送元の地域が0だと無効' do
          @item.delivery_area_id = 0
          @item.valid?
          expect(@item.errors.full_messages).to include('配送元の地域は0以外の値にしてください')
        end

        it '配送までの日数が1だと無効' do
          @item.delivery_date_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('配送までの日数は1以外の値にしてください')
        end

        it '価格が空欄だと無効' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格を入力してください')
        end

        it '価格が300円以下だと無効' do
          @item.price = 100
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は300より大きい値にしてください')
        end

        it '価格が9999999以上だと無効' do
          @item.price = 100_000_000
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は9999999より小さい値にしてください')
        end

        it '価格が全角だと無効' do
          @item.price = '５００'
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
        end

        it '価格が半角英語だと無効' do
          @item.price = 'aaaa'
          @item.valid?
          expect(@item.errors.full_messages).to include('販売価格は数値で入力してください')
        end
      end
    end
  end
end
