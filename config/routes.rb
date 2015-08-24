BallparkClient::Application.routes.draw do

  match 'auth' => 'pages#auth'
  match 'ballpark' => 'pages#ballpark'

  root :to => 'pages#index'

end
