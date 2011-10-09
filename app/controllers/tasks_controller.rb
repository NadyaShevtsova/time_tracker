class TasksController < ApplicationController
  before_filter :authenticate_user!, :new_project, :only => [:create, :update]
  before_filter :check_day_for_user, :except => [:index, :new, :create]
  helper_method :sort_column, :sort_direction

  def index
    @current_date = (params[:date]).nil? ? Date.today : Date.parse(params[:date])
   
   @tasks = (current_user.admin ? Task : current_user.tasks).where('start_time >= ? and end_time <= ?', @current_date.beginning_of_day, @current_date.end_of_day).paginate :page => params[:page], :per_page => (params[:per_page]).nil? ? 3 : params[:per_page], :include => ["project","user"], :order => "#{sort_column} #{sort_direction}"
  end

  def new
    @task = Task.new
    render :layout => "overlay"
  end

  def edit
    @task = Task.find(params[:id])
    render :layout => "overlay"
  end

  def create
    @task = Task.new(params[:task])
    
    if defined? @project
      @task.project_id = @project.id
    end
    @task[:user_id] = current_user.id unless current_user.admin
    respond_to do |format|
      format.js do
        render :update do |page|
          if @task.save
            flash[:notice] = "Task added success"
            page << "window.location.href = '#{root_path(:date => @task.start_time.strftime("%m/%d/%Y"))}'"
          else
            page << "$('.contentWrap').html('#{escape_javascript(render :template => "tasks/new")}')"
          end
        end
      end
    end
  end
 
  def update
    @task = Task.find(params[:id])
    
    if defined? @project
      params[:task][:project_id] = @project.id
    end
    respond_to do |format|
      format.js do
        render :update do |page|
          if @task.update_attributes(params[:task])
            flash[:notice] = 'Task was successfully updated.'
            page << "window.location.href = '#{root_path(:date => @task.start_time.strftime("%m/%d/%Y"))}'" 
          else
            page << "$('.contentWrap').html('#{escape_javascript(render :template => "tasks/edit")}')"
          end
        end
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to(tasks_url)
  end

  private

  def sort_column
    Task.column_names.include?(params[:sort]) ? params[:sort] : params[:sort] == "projects.name" ? params[:sort] : params[:sort] == "users.username" ? params[:sort] :"start_time"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def check_day_for_user
    if (params[:id].blank? or Task.find(params[:id]).start_time.strftime("%Y/%m/%d") != Time.now.strftime("%Y/%m/%d")) and !current_user.admin
      flash[:alert] = "You don't have access to this page"
      redirect_to :action => :index
    end
  end

  def new_project
     unless params[:new_project].blank?
       @project = Project.new(:name => params[:new_project])
       @project.save
     end
  end

end
