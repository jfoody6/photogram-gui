class UsersController < ApplicationController

  def index

    #get all users
    matching_users = User.all
    
    #order alphabetically
    @list_of_users = matching_users.order({ :username => :asc })


    render({ :template => "user_templates/index" })

  end 
  
  def show
    # Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})

    #uniqueness validated so 1 or 0 records are returned

    @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/show" })

  end

  def add

    user_add = params.fetch("input_username")
    @a_new_user = User.new

    @a_new_user.username = user_add

    @a_new_user.save

    redirect_to("/users/" + @a_new_user.username.to_s)
  end 

  def update

    user_update = params.fetch("input_username")
    user_id = params.fetch("user_id")
    matching_user = User.where({ :id => user_id })

    a_user = matching_user.at(0)

    a_user.username = user_update

    a_user.save

    redirect_to("/users/" + user_update.to_s)
  end 
end 
