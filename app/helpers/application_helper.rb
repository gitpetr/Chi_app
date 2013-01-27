module ApplicationHelper

  # Use this to highlight active page's (toolbar or link).
  # name - name of controller with whom link will assosiated.
  # current_controller - name of current controller.
  def active_link?( name, current_controller )
    if name == current_controller
      "active"
    else
      ""
    end
  end
end
