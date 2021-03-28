class Api::BlogsController < ApplicationController
  def create
    todo =Blog.create(title: params[:title], content:params[:content], description:params[:description])
    todo_valid =todo.valid?
    if todo_valid
      render json: {message: 'Successfully created todo list'}, status: 200
    else
      render jason: {message: 'unable to created todo list'}, status: 400
    end
end
