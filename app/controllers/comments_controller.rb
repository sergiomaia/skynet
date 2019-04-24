class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params.merge(user: current_user))
    if @comment.save
      redirect_back(fallback_location: root_path, notice: 'Comentário criado com sucesso.')
    else
      redirect_back(fallback_location: root_path, notice: @comment.errors.full_messages.join(', '))
    end
  end

  def destroy
    @customer = @comment.customer
    @comment.destroy
    redirect_to @customer, notice: 'O comentário foi removido.'
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :customer_id)
  end
end
