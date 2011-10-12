module TasksHelper
  def show_weeks
    date_now = (params[:date]).nil? ? Date.today : Date.parse(params[:date])
    current_day = date_now.beginning_of_month.beginning_of_week
    links = ""
    6.times do 
      links += link_to "week (#{current_day.strftime("%Y/%m/%d")} - #{current_day.end_of_week.strftime("%Y/%m/%d")})", root_path(:start_date => current_day.strftime("%Y/%m/%d"), :end_date => current_day.end_of_week.strftime("%Y/%m/%d"))
      links += "<br>"
      current_day = current_day + 7.days
      break if current_day.month !=  date_now.month
    end
    links
  end
end
