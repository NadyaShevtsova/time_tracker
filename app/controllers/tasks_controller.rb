class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params[:task])

    if @task.save
      format.html { redirect_to(@task, :notice => 'Task was succesfully created')}
    else
      format.html { render :action => "new"}
    end
  end

end
