Rails.application.routes.draw do
  resources :seasons do
    post 'register_team', to: 'seasons#register_team'
  end
  
  resources :leagues do
    resources :teams
  end
  
  resources :matches
  devise_for :players, controllers: {
    sessions: 'players/sessions',
    registrations: 'players/registrations'
  }
  root 'pages#home'
  
end
