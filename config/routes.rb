Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})

  post("/add_user", { :controller => "users", :action => "add"})
  post("/update_user/:user_id", { :controller => "users", :action => "update"})




  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:photo_id", { :controller => "photos", :action => "show"})

  get("delete_photo/:photo_id", { :controller => "photos", :action => "delete"})

  post("/insert_photo", { :controller => "photos", :action => "insert"})
  post("/update_photo/:photo_id", { :controller => "photos", :action => "edit"})
  post("/add_comment", { :controller => "photos", :action => "feedback"})
end
