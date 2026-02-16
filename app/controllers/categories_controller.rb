class CategoriesController < ApplicationController
  def index
    @categories = Category.all

    if params[:id].present?
      @category = Category.find(params[:id])
    else
      @category = Category.new
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to  categories_path, notice: "カテゴリーを作成しました"
    else
      flash.now[:alert] = "カテゴリー作成に失敗しました"
      redirect_back fallback_location: categories_path, notice: "カテゴリー作成に失敗しました"
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to request.referer, notice: "カテゴリーを更新しました"
    else
      flash.now[:alert] = "カテゴリー編集に失敗しました"
      render :index
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path, notice: "カテゴリーを削除しました。"
  end

  private

  def category_params
    params.require(:category).permit(:name, :color_code)
  end
end
