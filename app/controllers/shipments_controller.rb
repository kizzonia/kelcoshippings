class ShipmentsController < ApplicationController
  before_action :find_shipment, only: [  :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @shipments = Shipment.where(user_id: current_user)

  end
  def show
      @shipment = Shipment.find(params[:id])
  end

  def new
    @shipment = current_user.shipments.build
  end

  def create
    @shipment = current_user.shipments.build(shipment_params)

    if @shipment.save
      redirect_to @shipment
    else
      render 'new'
    end
  end

  def edit
    @shipment = Shipment.find(params[:id])
  end

  def update
    @shipment = Shipment.find(params[:id])
    if @shipment.update(params[:shipment].permit(:first_name, :last_name, :order_id, :billing_address2, :billing_address1, :e_mail, :delivery_address, :delivery_address_first_name, :delivery_address_last_name, :postcode, :phone_number, :quntity, :tax, :country, :notes)
  )
  redirect_to @shipment
else
  render 'edit'
end
  end

  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy
  end

  private
  def find_shipment
    @shipments = Shipment.find(params[:id])
  end
   def shipment_params
     params.require(:shipment).permit(:first_name, :last_name, :order_id, :billing_address2, :billing_address1, :e_mail, :delivery_address, :delivery_address_first_name, :delivery_address_last_name, :postcode, :phone_number, :quntity, :tax, :country, :notes)
   end
end
