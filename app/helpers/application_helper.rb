module ApplicationHelper

  # Use this to highlight active page's (toolbar or link).
  # :controllers - array of controllers. They can include their methods, for example: "pages", "pages#home".
  # => "active" or "".
  def active_link?( options={} )
    unless options.empty?
      controller_names = options[:controllers]

      controller_names.each do |name|
        if name.include?("#")                                                                       # The separator for method of controller. It may not exist.
          splitten_data           = name.split("#")
          current_controller_name = splitten_data.first
          current_action_name     = splitten_data.last

          return "active" if ( current_controller_name == controller.controller_name ) and
                             ( current_action_name == controller.action_name )
        else
          return "active" if name == controller.controller_name
        end
      end
    end

    return ""
  end

end
