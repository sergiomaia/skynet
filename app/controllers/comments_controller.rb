class CommentsController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    @comment = @customer.comments.build(params[:comment].permit(:body))
    @comment.user = current_user
    @comment.save
    redirect_to customer_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @comment = @customer.comments.find(params[:customer_id])
    @comment.destroy
    redirect_to customer_path(@customer)
  end
end
