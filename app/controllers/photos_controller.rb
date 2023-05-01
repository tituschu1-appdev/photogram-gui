class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    # parasms {"path_id"=>"777"}
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

     render({ :template => "photo_templates/show.html.erb"})

  end

  def baii
    # parasms {"path_id"=>"777"}
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy

    # render({ :template => "photo_templates/baii.html.erb"})

    redirect_to("/photos")
  end

  def create
    # Parameters: {"query_image"=>"", "query_caption"=>"", "query_owner_id"=>""}
    input_image = params.fetch("query_image")
    input_caption= params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    #render({ :template => "photo_templates/create.html.erb"})
    redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    #   Parameters: {"query_image"=>"https://miro.medium.com/v2/resize:fit:1216/1*zbnG0TmRzEEDVnWnfrLZwA.png", "query_caption"=>"2331231", "modify_id"=>"954"}

    the_id = params.fetch("modify_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption= params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)
    #render({ :template => "photo_templates/update.html.erb"})
  end

  def add_comment
    # Parameters: {"input_photo_id"=>"785", "input_author_id"=>"117", "input_body"=>"add"}

    the_id = params.fetch("input_photo_id")
    matching_photos = Photo.where({ :id => the_id})
    the_photo = matching_photos.at(0)

    the_author_id = params.fetch("input_author_id")
    the_comment = params.fetch("input_body")

    a_new_comment = Comment.new
    a_new_comment.body = the_comment
    a_new_comment.author_id = the_author_id
    a_new_comment.photo_id = the_id

    a_new_comment.save

    redirect_to("/photos/" + the_photo.id.to_s)
    #render({ :template => "photo_templates/comment.html.erb"})
  end

end
