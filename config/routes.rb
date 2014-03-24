Historiqueux::Engine.routes.draw do

  get '/historiqueux/:resource/:resource_id', to: 'history#index'
  get '/historiqueux/:resource/:resource_id/relations/:relation_resource', to: 'history#index_relations'
  get '/historiqueux/:resource/:resource_id/:version_id', to: 'history#show'

end
