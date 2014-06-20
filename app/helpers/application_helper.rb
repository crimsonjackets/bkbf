module ApplicationHelper
  def nav_active path
    if request.path == path
      return "active"
    end
  end
end
