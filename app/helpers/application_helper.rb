module ApplicationHelper
  def sortable(column, title, date)
    if column == session["#{current_user.id}_sort"]
      css_class = "current #{session["#{current_user.id}_direction"]}"
    else
      css_class = nil
    end
    if column == session["#{current_user.id}_sort"] && session["#{current_user.id}_direction"] == "asc"
      direction = "desc"
    else
      direction = "asc"
    end
    link_to title, {:sort => column, :direction => direction, :date => date}, {:class => css_class}
  end


end
