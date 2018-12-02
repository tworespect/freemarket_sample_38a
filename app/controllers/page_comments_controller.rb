class PageCommentsController < ApplicationController

  def create
    @page_comment = @product.product_page_comments.new(text: comment_params[:text], product_id: comment_params[:product_id], user_id: current_user.id)
    redirect_to "/products/#{@comment.product.id}"
  end

  def destroy
    page_comment = PageComment.find(params[:id])
    text = page_comment.text
    if current_user.id == @product.user_id
      text = "出品者がコメントを削除しました"
    end
  end


  private

  def comment_params
    params.permit(:text, :product_id)
  end

end
