Rails.application.routes.draw do
  root 'static_pages#home'
  #resources :requests
  #patch  '/request', to: 'requests#change_open_status'
  resources :requests do
    member do
      patch "change_status"
    end
  end

  resources :users
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post   '/apply',   to: 'request_applications#create'
  delete   '/withdraw',   to: 'request_applications#destroy'
end
