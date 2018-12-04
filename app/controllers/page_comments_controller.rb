class PageCommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @page_comment = @product.product_page_comments.new(page_comment_params)
    @page_comment.save
    redirect_to product_path(@product.id)
  end

  def destroy
    @product = Product.find(params[:product_id])
    page_comment = ProductPageComment.find(params[:id])
    if current_user.id == @product.user_id
      page_comment.text = "出品者がコメントを削除しました"
      page_comment.save
    end
    redirect_to product_path(@product.id)
  end


  private

  def page_comment_params
    params.require(:product_page_comment).permit(:text, :product_id).merge(user_id: current_user.id)
  end

end
