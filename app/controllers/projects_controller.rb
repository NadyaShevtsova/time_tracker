class ProjectsController < ApplicationController
  def create
    @project = Project.new(params[:project])
    @project[:user_id] = current_user.id
    if @project.save
      respond_to do |format|
        format.js do
          render :update do |page|
            page << "$('#task_project_id option:last').after('<option value=#{@project.id}>#{@project.name}</option>')"
          end
        end
      end
    end
  end
end
