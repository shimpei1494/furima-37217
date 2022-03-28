require 'rails_helper'

RSpec.describe PurchaseDeliveryAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase = FactoryBot.build(:purchase_delivery_address, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '購入機能テスト' do
    context '購入できる場合' do
      it "全ての値が正しく入力されれば購入できる" do
        expect(@purchase).to be_valid
      end
      it "建物名が空でも購入できる" do
        @purchase.building_name = ''
        expect(@purchase).to be_valid
      end
    end
    context '購入できない場合' do
      it "郵便番号が空では購入できない" do
        @purchase.post_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code can't be blank")
      end
      it "郵便番号にハイフンがなくては購入できない" do
        @purchase.post_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "郵便番号に全角数字が入ると購入できない" do
        @purchase.post_code = '１２３-4567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "都道府県が空(id=1)では購入できない" do
        @purchase.prefecture_id = 1
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空では購入できない" do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では購入できない" do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では購入できない" do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it "電話番号が10,11桁以外では購入できない（下限）" do
        @purchase.phone_number = '012345678'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number 10桁か11桁の半角数値をハイフン(-)なしで入力してください")
      end
      it "電話番号が10,11桁以外では購入できない（上限）" do
        @purchase.phone_number = '012345678912'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number 10桁か11桁の半角数値をハイフン(-)なしで入力してください")
      end
      it "電話番号にハイフンが含まれると購入できない" do
        @purchase.phone_number = '012-3456-7891'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number 10桁か11桁の半角数値をハイフン(-)なしで入力してください")
      end
      it "電話番号に全角数字が含まれると購入できない" do
        @purchase.phone_number = '０1234567891'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number 10桁か11桁の半角数値をハイフン(-)なしで入力してください")
      end
      it "user_idが空では購入できない" do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では購入できない" do
        @purchase.item_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では購入できない" do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
