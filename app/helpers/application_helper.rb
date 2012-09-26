module ApplicationHelper

  # Use this to highlight active page's (toolbar or link).
  # root_path - we pass this path only if we want highlight link for 2 different paths.
  def active_link?( path, root_path=nil )
    if current_page?( path )
      "active"
    elsif !root_path.nil? and current_page?( root_path )
      "active"
    else
      ""
    end
  end
end
