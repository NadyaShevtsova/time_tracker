module ApplicationHelper
  def sortable(column, title, date)
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :date => date}, {:class => css_class}
  end

 
end
