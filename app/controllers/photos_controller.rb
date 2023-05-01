class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc})

    render({ :template => "photos_templates/index.html.erb"})
  end

  def show
    # parasms {"path_username"=>"anisa"}
    #url_username = params.fetch("path_username")

    #matching_usernames = User.where({ :username => url_username})

    #@the_user = matching_usernames.at(0)

    #if @the_user == nil
     # redirect_to("/404")
    #else
     # render({ :template => "user_templates/show.html.erb"})
    #end
  end
end
