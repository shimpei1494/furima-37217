require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての項目に正しく入力があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが存在しないと登録できない' do

      end

      it 'emailが存在しないと登録できない' do

      end
      it 'emailに@が含まれていないと登録できない' do
      end

      it 'emailが一意性でないと登録できない' do
      end

      it 'passwordが存在しないと登録できない' do
        
      end

      it 'passwordは5文字以下では登録できない' do
      end

      it 'passwordは半角英数字混合でないと登録できない' do
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do

      end

      it 'family_nameが存在しないと登録できない' do
      end

      it 'family_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      end

      it 'first_nameが存在しないと登録できない' do
      end

      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      end

      it 'family_name_kanaが存在しないと登録できない' do
      end

      it 'family_name_kanaが全角（カタカナ）以外では登録できない' do
      end

      it 'first_name_kanaが存在しないと登録できない' do
      end

      it 'first_name_kanaが全角（カタカナ）以外では登録できない' do
      end

      it 'birth_dayが存在しないと登録できない' do
        
      end

    end
  end
end