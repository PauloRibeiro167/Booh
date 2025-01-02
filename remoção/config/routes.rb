Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :users
    resources :cargos
    resources :setores
    resources :atribuicoes
    resources :delegacoes
    get 'pages', to: 'pages#index'
  end

  namespace :public do
    get "pages/index"
    get "pages/edit"
    get "pages/new"
    get "pages/show"
    get 'pages', to: 'home#index'
  end

  root 'public/pages#index'
end