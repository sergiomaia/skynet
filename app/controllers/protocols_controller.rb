class ProtocolsController < ApplicationController
 def create
  @customer = Customer.find(params[:customer_id])
  @protocol = @customer.protocols.build(params[:protocol].permit(:number, :call_time))
  @protocol.user = current_user
  @protocol.save
  redirect_to customer_path(@customer)
 end

 def destroy
  @customer = Customer.find(params[:customer_id])
  @protocol = @customer.protocols.find(params[:customer_id])
  @protocol.destroy
  redirect_to customer_path(@customer)
 end
end
