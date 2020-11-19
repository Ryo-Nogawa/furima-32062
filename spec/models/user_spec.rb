require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいく場合' do
        it 'email,password,password_confirmation,nickname,last_name,first_name,kana_last_name,kana_first_name,birthdayが存在するば有効' do
          expect(@user).to be_valid
        end
      end

      context '新規登録がうまく行かない場合' do
        it 'passwordが空だと無効' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードを入力してください')
        end
        it 'passwordが半角英数字を混合しないと無効' do
          @user.password = 'aaaaaaaa'
          @user.password_confirmation = 'aaaaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは不正な値です')
        end

        it 'passwordが6文字以下だと無効' do
          @user.password = '11aaa'
          @user.password_confirmation = '11aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('パスワードは不正な値です')
        end

        it '重複するemailは無効' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
        end

        it 'last_nameが空だと無効' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('名字を入力してください')
        end

        it 'last_nameが漢字・平仮名以外だと無効' do
          @user.last_name = 'aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('名字は不正な値です')
        end

        it 'first_nameが空だと無効' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('名前を入力してください')
        end

        it 'first_nameが漢字・平仮名以外だと無効' do
          @user.first_name = 'aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前は不正な値です')
        end

        it 'kana_last_nameがカタカナ以外だと無効' do
          @user.kana_last_name = '田中'
          @user.valid?
          expect(@user.errors.full_messages).to include('名字（カナ）は不正な値です')
        end

        it 'kana_first_nameがカタカナ以外だと無効' do
          @user.kana_first_name = '太郎'
          @user.valid?
          expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
        end

        it 'birthdayが空だと無効' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include('生年月日を入力してください')
        end
      end
    end
  end
end
