# frozen_string_literal: true

module Api
  class BlogsController < ApplicationController
    before_action :user_exists, except: [:index]

    def index
      render json: Blog.joins(:user, :category).all.map { |blogs| 
        {
        id: blogs.id,
        title: blogs.title,
        content: blogs.content,
        author: blogs.user.username,
        category: blogs.category.tag,
        createAt: blogs.created_at }
      }
    end

    def myblog
      myblog = Blog.joins(:user, :category).where(user_id: params[:loginUser_id])
      response = myblog.map { |blog| 
       {
        title: blog.title,
        content: blog.content,
        author: blog.user.username,
        category: blog.category.tag,
        createAt: blog.created_at
        }
      }
      render json: response, status: :ok
    end

    def create
      puts "-------create blogs-----"
      puts params[:title]
      puts params[:content]
      puts params[:categoryId]
      puts params[:loginUser_id]

      blog = Blog.create(
        title: params[:title],
        content: params[:content],
        category_id: params[:category_id],
        user_id: params[:loginUser_id]
      )

      blog_valid = blog.valid?
      if blog_valid
        render json: { message: 'Successfully created blog' }, status: 200
      else
        render json: { message: 'unable to created blog' }, status: 400
      end
    end

    def show
      puts params[:id]
      render json: Blog.find(params[:id])
    end

    def update
      blog = Blog.find(params[:id])
      p 'update'
      p params[:loginUser_id]
      p blog.user_id
      if params[:loginUser_id] == blog.user_id
        blog.update(
          title: params[:title],
          content: params[:content],
          category_id: params[:category_id]
        )
        render json: { message: 'Successfully updated blogs' }, status: 200
      else
        render json: { message: 'Unauthorised author, unable to change blog!' }, status: 403
      end
    end

    def destroy
      blog = Blog.find(params[:id])
      if blog&.user_id == params[:loginUser_id]
        blog.destroy
        render json: { message: 'Blog deleted successfully' }, status: 200
      else
        render json: { message: 'unable to delete blog' }, status: 403
      end
    end
  end
end
