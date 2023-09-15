Rails.application.routes.draw do
  resources :seasons do
    member do
      post 'generate_schedule'
      post 'generate_matches'
    end
    resources :matches
  end
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
