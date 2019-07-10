module ApplicationHelper
  def sortable(column, title =nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to column, sort_users_path
  end
end
