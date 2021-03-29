class Api::BlogsController < ApplicationController

  def index
    render json: Blog.all
  end

  def create
    puts params[:title]
    puts params[:content]
    puts params[:categoryId]

    blog = Blog.create(
      title: params[:title],
      content: params[:content],
      category_id: params[:categoryId],
      user_id: params[:userId]
    )

    blog_valid = blog.valid?
    if blog_valid
      render json: {message: 'Successfully created blog'}, status: 200
    else
      render json: {message: 'unable to created blog'}, status: 400
    end
  end


def show
  puts params[:id]
  render json: Blog.find(params[:id])
end

def update
  render json: Blog.find(params[:id]).update(title: params[:title], content: params[:content], category_id: params[:categoryId], user_id: params[:userId]), status: 200
end

def destroy
  Blog.destroy(params[:id])
  render json: {message: 'Blog deleted successfully'}, status: 200
end

end

