module TasksHelper
  def show_weeks
    date_now = (params[:date]).nil? ? Date.today : Date.parse(params[:date])
    current_day = date_now.beginning_of_month.beginning_of_week
    links = ""
    6.times do 
      links += link_to "week (#{current_day.strftime("%Y/%m/%d")} - #{current_day.end_of_week.strftime("%Y/%m/%d")})", reports_index_path(:start_date => current_day.strftime("%Y/%m/%d"), :end_date => current_day.end_of_week.strftime("%Y/%m/%d"))
      links += "<br>"
      current_day = current_day + 7.days
      break if current_day.month !=  date_now.month
    end
    links
  end

  def transfer_params
    {:sort => sort_column, :direction => sort_direction, :per_page => params_perpage }    
  end

  def helper_for_sortable(column_name,column_name_in_view)
    content_tag :th do
      sortable(column_name, column_name_in_view, params[:date], params[:per_page])
    end
  end

end
