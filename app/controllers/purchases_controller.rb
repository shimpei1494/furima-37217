class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item

  def index
    if @item.user_id != current_user.id && @item.purchase == nil
      @purchase_delivery_address = PurchaseDeliveryAddress.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchase_delivery_address = PurchaseDeliveryAddress.new(purchase_params)
    if @purchase_delivery_address.valid?
      pay_item
      @purchase_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery_address).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price, 
      card: purchase_params[:token],    
      currency: 'jpy'                 
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
