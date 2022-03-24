class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseDeliveryAddress.new
  end

  def create
  end
end
