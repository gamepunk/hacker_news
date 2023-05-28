class CommentsController < ApplicationController
  before_action :set_item, only: %i[ show create destroy ]
  before_action :authenticate_user!, only: %i[ show create destroy ]
  load_and_authorize_resource

  layout "short", only: %i[ show ]

  def index
    @comments = Comment.page(params[:page])
  end

  def show
    @comment = @item.comments.find(params[:id])
  end

  def create
    @comment = @item.comments.create comment_params
    @comment.user = current_user

    if @item.save
      redirect_to @item
    end

  end

  # DELETE /items/1 or /items/1.json
  def destroy
    if current_user.role == "admin"
      @comment = @item.comments.find(params[:id])
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to @comment.item }
        format.json { head :no_content }
      end
    end
  end

  private
    def set_item
      @item = Item.find(params[:item_id])
    end

    def comment_params
      params.require(:comment).permit(:text, :parent_comment_id, :user_id)
    end
end
