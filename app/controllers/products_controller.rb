# frozen_string_literal: true

class ProductsController < ApplicationController
  layout 'dashboard'
  def index
  @products = Product.all
  end

  def new
    @product = Product.new
  end
end
