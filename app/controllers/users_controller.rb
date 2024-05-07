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

end 
