Rails.application.routes.draw do
  get 'requests/new'
  root 'static_pages#home'
  get 'home' => 'static_pages#home'
end
