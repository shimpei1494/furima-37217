require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿' do
    context '投稿できる場合' do
      it "全ての入力が制限に沿って入力されていれば投稿できる" do
        expect(@item).to be_valid
      end
    end

    context '投稿できない場合' do
      it "nameが空では保存できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "画像が添付されていなければ保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品の説明がなければ保存できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "カテゴリーの情報がなければ保存できない" do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態の情報がなければ保存できない" do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担の情報がなければ保存できない" do
        @item.delivery_fee_task_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee task can't be blank")
      end
      it "発送元地域の情報がなければ保存できない" do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数の情報がなければ保存できない" do
        @item.delivery_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it "価格がなければ保存できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格が299以下では保存できない" do
        @item.price = '10'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を指定範囲内で入力してください")
      end
      it "価格が10000000以上では保存できない" do
        @item.price = '500000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を指定範囲内で入力してください")
      end
      it "価格が全角数値では保存できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を指定範囲内で入力してください")
      end
      it "価格が数値以外では保存できない" do
        @item.price = 'Hello'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price 半角数字を指定範囲内で入力してください")
      end
      it "ユーザー情報がないと保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
