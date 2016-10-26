class CommentsController < ApplicationController

  def create
    @shipment = Shipment.find(params[:shipment_id])
    @comment = @shipment.comments.create(params[:comment].permit(:status, :location))

    redirect_to shipment_path(@shipment)
  end

  def destroy
    @shipment = Shipment.find(params[:shipment_id])
    @comment = @shipment.comments.find(params[:id])
    @comment.destroy
  end
end
