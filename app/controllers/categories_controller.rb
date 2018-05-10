class CategoriesController < ApplicationController

  before_action :authenticate_user!, except: [:show]

  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @posts = Post.where(category_id: [@category.subtree_ids])
  end

  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Category successfully create'
    else
      @categories = Category.all.order(:name)
      flash[:danger] = 'Category not create'
      render :new
    end
  end

  def edit
    @categories = Category.where("id != ?", @category.id).order(:name)
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path, success: 'Category successfully update'
    else
      @categories = Category.where("id != ?", @category.id).order(:name)
      flash[:danger] = 'Category not update'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Category successfully delete'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end