Apartments::Application.routes.draw do


  resources :photos

  namespace :admin do
    resources :apartments
    resources :pages
    root :to => "apartments#index"
  end

  devise_for :users

  #resources:
  # GET
  # index -- /images
  # show -- /images/:id
  # new -- /images/new
  # edit -- /images/:id/edit
  #
  # POST
  # create -- /images
  # update -- /images/:id?method=put | PUT
  # destroy -- /images/:id?method=delete | DELETE
#  resources :images, :except => :show

  # /apartments/1
  # /apartments/2
  # /apartments/2/rooms?en=ru
  # member & collection- additional routes we create
#  match 'apartments/:number_of_rooms/rooms' => 'apartments#rooms'
  # collection:
  # index, new, create
  #
  # member:
  # edit, show, update, destroy --- need id
  # you can use object
  # apartments_url(object.id)
  # link_to, redirect_to
  # link object, redirect_to object
  # link_to image, comment -- /images/:image_id/comment/:comment_id - GET
  # link__to '', admin_apartments_url(object.id)
  # link_to '', [:admin, object]
  # link_to '', [image, comment]
  root :to => "welcome#index"
#  resources :tits, :only => :index

  resources :apartments, :only => [:index, :show] do
    member do
      get 'rooms', :constraints => {:id => /[123]/}
      
    end
  end
  # 50 в самый низ
  match '/:url' => 'pages#show'


end
