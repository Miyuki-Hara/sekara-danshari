require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての入力事項があれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上の半角英数字であれば登録できる' do
        @user.password = '123abc'
        @user.password_confirmation = '123abc'
      end
      it 'profileが空でも登録できる' do
        @user.profile = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailは@がないと登録できない' do
        @user.email = 'aaaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'emailが登録済みのものと重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください', 'パスワードは半角の英字と半角の数字を含めて設定してください',
                                                      'パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'password（password_confirmation含む）が５文字以下だと登録できない' do
        @user.password = '123ab'
        @user.password_confirmation = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'password（password_confirmation含む）が半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角の英字と半角の数字を含めて設定してください')
      end
      it 'password（password_confirmation含む）が半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角の英字と半角の数字を含めて設定してください')
      end
      it 'password（password_confirmation含む）が全角を含むと登録できない' do
        @user.password = 'abc45６'
        @user.password_confirmation = 'abc45６'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角の英字と半角の数字を含めて設定してください')
      end
      it 'password_confirmationが空だと登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
    end
  end
end
