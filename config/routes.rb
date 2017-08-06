Rails.application.routes.draw do
  resources :likes
  resources :palabras
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :imagens
  devise_for :users
  root 'home#index'

  post 'identificarme' => 'home#index', :as => 'identificarme'
  post 'elegir' => 'home#elegir', :as => 'elegir'
  post 'resultados' => 'home#resultados', :as => 'resultados'
  get 'resultados' => 'home#resultados'
  get 'reportes' => 'home#reportes'
  get 'reportes/:palabra' => 'home#reportes', :as => 'reportepalabra'

  #get 'home/buscar'
  #get 'home/elegir'
  #get 'home/resultados'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
