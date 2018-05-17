Rails.application.routes.draw do
  get 'scaffold_controller/Portfolio'

  # users
  root "user#index"
  post "/user/register" => "user#create"
  get "/user/show/:id" => "user#show"
  post "/user/edit/:id" => "user#edit"
  

  # session logging
  post "/session/create" => "session#create"
  get "/session/destroy" => "session#destroy"

  # portfolio
  get "/portfolio/index" => "portfolio#index"
  get "/portfolio/new" => "portfolio#new"
  post "/portfolio/create" => "portfolio#create"
  post "/portfolio/edit/:id" => "portfolio#edit"

  # connection

  post "/connection/create" => "connection#create"
  post "/connection/destroy/:id" => "connection#destroy"
  post "/connection/update/:id" => "connection#update"
  post "/connection/edit/:id" => "connection#edit"


end
