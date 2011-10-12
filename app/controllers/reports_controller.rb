class ReportsController < ApplicationController
  def index
    @list = Task.where(:start_time => DateTime.parse(params[:start_date])..DateTime.parse(params[:end_date])).group("user_id, task_name")
  end

end
