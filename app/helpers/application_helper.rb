module ApplicationHelper

  # Use this to highlight active page's (toolbar or link).
  # names - list of names for controllers with whom links will assosiated.
  # current_controller - name of current controller.
  def active_link?( names, current_controller )
    names.each{ |name| return "active" if name == current_controller }

    return ""
  end
end
