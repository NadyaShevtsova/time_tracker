class TasksController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  def index
    @current_date = (params[:date]).nil? ? Date.today : Date.parse(params[:date])
    
    if current_user.admin 
      @tasks = Task.where('start_time >= ? and end_time <= ?', @current_date.beginning_of_day, @current_date.end_of_day).order(sort_column + " " + sort_direction).paginate :page =>params[:page], :per_page => (params[:per_page]).nil? ? 3 : params[:per_page]
    else 
      @tasks = current_user.tasks.where('start_time >= ? and end_time <= ?', @current_date.beginning_of_day, @current_date.end_of_day).order(sort_column + " " + sort_direction).paginate :page =>params[:page], :per_page => (params[:per_page]).nil? ? 3 : params[:per_page]
    end
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
    @task[:user_id] = current_user.id unless current_user.admin

    if @task.save
       redirect_to :action => "index"
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

private

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : "start_time"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
