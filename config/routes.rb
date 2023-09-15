Rails.application.routes.draw do
<<<<<<< HEAD
<<<<<<< HEAD
  resources :seasons do
    member do
      post 'generate_schedule'
      post 'generate_matches'
    end
    resources :matches
  end
=======
  resources :seasons
>>>>>>> parent of c8636d4 (schedule stuff)
=======
  resources :seasons
>>>>>>> parent of c8636d4 (schedule stuff)
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
