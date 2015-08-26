BallparkClient::Application.routes.draw do

  match 'auth' => 'pages#auth'
  match 'forward' => 'pages#forward'
  match 'ballpark' => 'pages#ballpark'

  root :to => 'pages#index'

end
