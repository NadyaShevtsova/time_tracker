class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id]) 
  end

  def create
    @task = Task.new(params[:task])

    if @task.save
       redirect_to(@task, :notice => 'Task was succesfully created')
    else
       render :action => "new"
    end
  end
 
  def update
    @task = Task.find(params[:id])

    if @task.update_attributes(params[:task])
      redirect_to(@task, :notice => 'Task was successfully updated.')
    else
      render :action => "edit"
    end
  end

end
