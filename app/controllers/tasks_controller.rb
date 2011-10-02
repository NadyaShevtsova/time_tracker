class TasksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @current_date = (params[:date]).nil? ? Date.today : Date.parse(params[:date])

    @project_ids = current_user.projects.collect{ |i| i.id }
    @tasks = Task.where(:project_id => @project_ids).where('start_time >= ? and end_time <= ?', @current_date.beginning_of_day, @current_date.end_of_day).paginate :page =>params[:page], :per_page =>3
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

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to(tasks_url)
  end

end
