class PostsController < ApplicationController
  def index
    @product = Product.all
  end
end
