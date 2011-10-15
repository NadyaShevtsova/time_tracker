module ApplicationHelper
  def sortable(column, title, date)
    css_class = column == session["#{current_user.id}_sort"] ? "current #{session["#{current_user.id}_direction"]}" : nil
    direction = column == session["#{current_user.id}_sort"] && session["#{current_user.id}_direction"] == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :date => date}, {:class => css_class}
  end


end
