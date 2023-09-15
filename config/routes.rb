Rails.application.routes.draw do
  resources :seasons
  resources :teams do
    post 'join', on: :member
    delete 'leave', on: :member
  end
  resources :leagues
  devise_for :players, controllers: {
    sessions: 'player/sessions',
    registrations: 'player/registrations'
  }
  root 'pages#home'
  
end
