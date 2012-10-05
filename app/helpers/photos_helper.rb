module PhotosHelper

  def set_active_first_photo( index )
    ( index == 0 ) ? "active" : ""
  end
end
