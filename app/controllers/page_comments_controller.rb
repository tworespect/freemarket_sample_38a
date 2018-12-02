class PageCommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @page_comment = @product.product_page_comments.new(page_comment_params)
    @page_comment.save
    redirect_to product_path(@product.id)
  end

  def destroy
    page_comment = PageComment.find(params[:id])
    text = page_comment.text
    if current_user.id == @product.user_id
      text = "出品者がコメントを削除しました"
    end
  end


  private

  def page_comment_params
    params.require(:product_page_comment).permit(:text, :product_id).merge(user_id: current_user.id)
  end

end
