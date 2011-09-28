class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
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

end
