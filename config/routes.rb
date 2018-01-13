Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :people, only: [:create, :show, :update] do
    resources :gift_ideas, only: [:index]
  end

  resources :family, only: [:show]

  get '/yolo', to: 'family#yolo'
end
