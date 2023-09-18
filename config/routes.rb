Rails.application.routes.draw do
  resources :teams do
    post 'join', on: :member
    delete 'leave', on: :member
  end
  resources :seasons do
    post 'generate_schedule', on: :member
  end
  resources :leagues
  resources :matches do
    post 'select', on: :member
    post 'confirm_selection', on: :member
  end
  devise_for :players, controllers: {
    sessions: 'player/sessions',
    registrations: 'player/registrations'
  }
  root 'pages#home'

end
