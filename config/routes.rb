Historiqueux::Engine.routes.draw do

  get '/historiqueux/:resource/:resource_id', to: 'history#index'
  get '/historiqueux/:resource/:resource_id/:version_id', to: 'history#show'

end
