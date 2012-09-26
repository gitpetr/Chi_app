module PhotosHelper
  # Helper to show photo inline.
  def photos_inline( photo )
    content_tag(:div, :class => 'span4') do
      image_tag photo.image_url(:thumb), :style => "padding: 10px;" unless photo.nil?
    end
  end
end
