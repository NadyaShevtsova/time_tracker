class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_day_for_user, :except => [:index, :new, :create, :task_name_list]
  helper_method :sort_column, :sort_direction

  def index
    @current_date = (params[:date]).nil? ? Date.today : Date.parse(params[:date])
   @tasks = (current_user.admin ? Task : current_user.tasks).where('start_time >= ? and end_time <= ?', @current_date.beginning_of_day, @current_date.end_of_day).paginate :page => params[:page], :per_page =>(params[:per_page]).nil? ? 3 : params[:per_page], :include => ["project","user"], :order =>"#{sort_column} #{sort_direction}"
  end

  def new
    @task = Task.new
    @task.build_project
    render :layout => "overlay"
  end

  def edit
    @task = Task.find(params[:id])
    @task.build_projectTask description
    render :layout => "overlay"
  end

  def create
    params[:task].delete("project_attributes") unless params[:task][:project_id].eql?("add_project")

    @task = Task.new(params[:task])

    @task[:user_id] = current_user.id unless current_user.admin
    respond_to do |format|
      format.js do
        render :update do |page|
          if @task.save
            flash[:notice] = "Task added success"
            page << "window.location.href = '#{root_path(:date => @task.start_time.strftime("%Y/%m/%d"))}'"
          else
            @task.build_project
            page << "$('.contentWrap').html('#{escape_javascript(render :template => "tasks/new")}')"
          end
        end
      end
    end
  end

  def update
    @task = Task.find(params[:id])

    params[:task].delete("project_attributes") if params[:task][:project_attributes][:name].blank?
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

  def task_name_list
    list = []
    (current_user.admin ? Task : current_user.tasks).where("task_name LIKE ?", "%" + params["term"] + "%").each do |task|
      list << {:label => task.task_name}
    end
    render(:json => list)
  end

  def details
    @details = Task.where(:start_time => DateTime.parse(params[:start_date])..DateTime.parse(params[:end_date]),:user_id => params[:user_id], :project_id => params[:project_id], :task_name => params[:task_name])
   
    respond_to do |format|
      format.js do
        render :update do |page|
          page << "$('tr##{params[:id]}_#{params[:user_id]}_#{params[:project_id]} a.link_to_ajax').addClass('hide')"
          page << "$('tr##{params[:id]}_#{params[:user_id]}_#{params[:project_id]} a.link_to_func').removeClass('hide')"
          page << "$('tr##{params[:id]}_#{params[:user_id]}_#{params[:project_id]}').after('#{escape_javascript(render :partial => "details")}')"
        end
      end
    end
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

