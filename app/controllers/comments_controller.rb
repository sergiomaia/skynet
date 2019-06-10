class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params.merge(user: current_user))
    @valid = @comment.save
    @message = if @valid
      @customer = @comment.customer
      'Comentário criado com sucesso.'
    else
      @comment.errors.full_messages.join(', ')
    end

    respond_to do |format|
      format.js
      format.html { redirect_back(fallback_location: root_path, notice: @message) }
    end
  end

  def destroy
    @customer = @comment.customer
    @comment.destroy

    respond_to do |format|
      format.js
      format.html { redirect_back(fallback_location: root_path, notice: 'O comentário foi removido.') }
    end
  end

  private

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :customer_id)
  end
end
