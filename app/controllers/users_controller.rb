class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    # parasms {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show.html.erb"})
    end
  end

  def add_user
    # Parameters: {"input_username"=>"aaa"}
    new_username = params.fetch("input_username")

    a_new_user = User.new
    a_new_user.username = new_username

    a_new_user.save

    redirect_to("/users/" + a_new_user.username)
    # render({ :template => "user_templates/new_user.html.erb"})
  end

  def update_user
    # Parameters: {"input_username"=>"chi", "path_username"=>"114"}

    the_username = params.fetch("input_username")

    the_user_id = params.fetch("path_username")
    matching_user = User.where({ :id => the_user_id})
    the_user = matching_user.at(0)

    the_user.username = the_username

    the_user.save

    redirect_to("/users/" + the_user.username)
    
    #render({ :template => "user_templates/update_user.html.erb"})
  end

end
