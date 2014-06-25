module ApplicationHelper
  def nav_active path
    (request.path == path) ? "active" : nil
  end
end
