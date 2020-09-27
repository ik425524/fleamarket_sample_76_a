class ProductsController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit]
  before_action :set_product, only: [:destroy, :edit, :show, :update]

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

  def destroy
    if user_signed_in? && current_user.id == @product.user_id
      @product.destroy
    else
      redirect_to root_path, alert: "削除に失敗しました"
    end
  end

  def edit
  end

  def show
  end


  def get_category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  def edit
    @grandchild = Category.find(@product.category_id)
    @child = @grandchild.parent
    @parent = @child.parent
  end

  def update
    if @product.update!(product_params)
      redirect_to root_path, notice: '商品を編集しました'
    else
      render "edit"
    end
  end

  def destroy
    if user_signed_in? && current_user.id == @product.user_id
      if @product.destroy
        redirect_to root_path, notice: '商品を削除しました'
      else
        render "show", alert: "削除に失敗しました"
      end
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :brand, :size_id, :state_id, :cost_id, :region_id, :period_id, :category_id, images_attributes: [:image, :_destroy, :id] ).merge(user_id: current_user.id)
  end

  def set_parents
    @category_parents = Category.where(ancestry: nil)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
