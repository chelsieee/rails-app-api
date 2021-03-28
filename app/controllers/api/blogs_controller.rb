class Api::BlogsController < ApplicationController
  def create
    puts params[:title]
    puts params[:content]
    puts params[:categoryId]

    todo = Blog.create(
      title: params[:title],
      content: params[:content],
      category_id: params[:categoryId],
      user_id: '1'
    )

    todo_valid = todo.valid?
    if todo_valid
      render json: {message: 'Successfully created todo list'}, status: 200
    else
      render json: {message: 'unable to created todo list'}, status: 400
    end
  end
end
