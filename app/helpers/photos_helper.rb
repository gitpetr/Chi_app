module PhotosHelper
  def slideshow_btn( first_photo )
    # photo-Link id uses to show slideshow, so, if you changes it then look into: photo.js.coffee and _photo.html.slim
    content_tag :div, :class => "pagination-centered" do
      link_to "#", :class => "btn btn-large btn-primary", :id => "photo-Link", "data-id" => first_photo.id do
        ( t(".slideshow") + content_tag(:i, "", :class => "icon-play-circle") ).html_safe
      end
    end
  end
end
