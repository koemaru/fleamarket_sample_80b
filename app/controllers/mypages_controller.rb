class MypagesController < ApplicationController

  def show
    if user_signed_in?
      @selected_product = Product.includes(:images).find(params[:id])
      @categories = Category.all
    else
      redirect_to new_user_session_path
    end
  end

  def destroy
    delete_product = Product.find(params[:id])
    delete_product.destroy
    redirect_to mypages_path
  end

end