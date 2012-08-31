module ApplicationHelper

  # Use this to highlight active page's (toolbar or link).
  def active_link?( path )
    if current_page?( path )
      "active"
    else
      ""
    end
  end
end
