class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def update
    if @comment.update(comment_params)
      redirect_back(fallback_location: root_path, notice: 'O comentário foi editado com sucesso.')
    else
      redirect_back(fallback_location: root_path, notice: @comment.errors.full_messages.join(', '))
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    permited_params = params.require(:comment).permit(:body)
  end
end
