module ApplicationHelper
  def sortable(column, title, date, per_page)
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction, :date => date, :per_page => per_page}, {:class => css_class}
  end
end
