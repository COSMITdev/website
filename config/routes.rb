Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  get 'sobre',       to: 'pages#about',       as: :about
  get 'servicos',    to: 'pages#services',    as: :service
  get 'trabalhos',   to: 'pages#works',       as: :work
  post 'contato',    to: 'contacts#create',   as: :contact
  post 'newsletter', to: 'newsletter#create', as: :newsletter
  post 'protocamp',  to: 'protocamp#create'

  resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]

  get '*path', to: 'pages#404', via: :all
end
