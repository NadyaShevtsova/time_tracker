module TasksHelper
  def show_weeks
    date_now = (params[:date]).nil? ? Date.today : Date.parse(params[:date])
    start_week = date_now.beginning_of_month.beginning_of_week
    links = ""
    6.times do 
      links += link_to "week (#{start_week.strftime("%Y/%m/%d")} - #{start_week.end_of_week.strftime("%Y/%m/%d")})", reports_index_path(:start_date => start_week.strftime("%Y/%m/%d"), :end_date => start_week.end_of_week.strftime("%Y/%m/%d"))
      links += "<br>"
      start_week = start_week + 7.days
      break if start_week.month !=  date_now.month
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
