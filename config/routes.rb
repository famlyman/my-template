Rails.application.routes.draw do
  devise_for :players, controllers: {
    sessions: 'players/sessions',
    registrations: 'players/registrations'
  }
  root 'pages#home'
  
end
