# frozen_string_literal: true

class Api::CategoriesController < ApplicationController
  before_action :user_exists, except: [:index]

  def index
    render json: Category.all
  end

  def create
    category = Category.create(category_params)
    if category.valid?
      render json: category, status: 201
    else
      render json: {message: 'Unable to create category'}, status: 500
    end
  end

  def show
    puts params[:id]
    render json: Category.find(params[:id])
  end

  def update
    render json: Category.find(params[:id]).update(category_params)
  end

  def destroy
    Category.destroy(params[:id])
    render json: {message: 'Category has been deleted!!!!!'}
  end

  def category_params
    params.permit(:tag)
  end
end
