module ApplicationHelper
  def helper_picture_url(pool)
    if pool.photo?
      cl_image_path(pool.photo.path)
    else
      "http://twindolphinpools.com/wp-content/uploads/2014/06/Ducky3.jpg"
    end
  end

   def helper_picture_tag(pool)
    if pool.photo?
      cl_image_tag(pool.photo.path)
    else
      "http://twindolphinpools.com/wp-content/uploads/2014/06/Ducky3.jpg"
    end
  end
end

