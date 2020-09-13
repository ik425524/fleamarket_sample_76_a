class ProductsController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit]

  def index
    @products = Product.includes(:images).order('created_at DESC')
  end
  
  def new
    @product = Product.new
    @product.images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end


  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :brand_id, :size_id, :state_id, :cost_id, :region_id, :period_id, :category_id, images_attributes: [:image, :_destroy, :id] ).merge(user_id: current_user.id)
  end

  def set_parents
    @category_parents = Category.where(ancestry: nil)
  end


end
