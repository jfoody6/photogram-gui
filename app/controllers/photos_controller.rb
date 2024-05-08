class PhotosController < ApplicationController

  def index

    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index" })

  end 


  def show
    url_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show" })

  end 

  def delete

    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    #render({ :template => "photo_templates/delete" })
    redirect_to("/photos")

  end

  def insert
 
    # Parameters: {"input_image"=>"a", "input_caption"=>"b", "owner_id"=>"c"}
    
    img_url = params.fetch("input_image")
    img_caption = params.fetch("input_caption")
    img_ownerID = params.fetch("owner_id")
    
    a_new_photo = Photo.new
    
    a_new_photo.image = img_url
    a_new_photo.caption = img_caption
    a_new_photo.owner_id = img_ownerID

    a_new_photo.save

    #render({ :template => "photo_templates/insert" })
    redirect_to("/photos/" + a_new_photo.id.to_s)

  end

  def edit

    #{"input_image"=>"https://robohash.org/dolorehicincidunt.png?size=300x300&set=set1", "input_caption"=>"Once you’ve accepted your flaws, no one can use them asd against you.", "photo_id"=>"777"}

    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => the_id})
    a_photo = matching_photos.at(0)

    a_photo.image = params.fetch("input_image")
    a_photo.caption = params.fetch("input_caption")

    a_photo.save

    redirect_to("/photos/" + a_photo.id.to_s)
  end
  
  def feedback

    # Parameters: {"input_photo_id"=>"777", "input_author_id"=>"117", "input_comment"=>"hi"}

    the_id = params.fetch("input_photo_id")
    the_author = params.fetch("input_author_id")
    the_comment = params.fetch("input_comment")

    a_new_comment = Comment.new

    a_new_comment.photo_id = the_id
    a_new_comment.body = the_comment
    a_new_comment.author_id = the_author

    a_new_comment.save

    redirect_to("/photos/" + the_id.to_s)
  end 


end 
