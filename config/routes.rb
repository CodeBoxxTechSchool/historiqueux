Historiqueux::Engine.routes.draw do

  get "history/index"
  get '/historiqueux/:resource/:resource_id', to: 'history#index'

end
