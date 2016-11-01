Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  get 'protocamp',                                  to: 'protocamp#index',       as: :protocamp
  get 'servicos',                                   to: 'pages#services',        as: :service
  get 'trabalhos',                                  to: 'pages#works',           as: :work
  post 'contato',                                   to: 'contacts#create',       as: :contact
  post 'inscricao',                                 to: 'subscribers#create',    as: :subscribe
  post 'newsletter',                                to: 'newsletter#create',     as: :newsletter

  resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]
  resources :quizzes, path: 'descubra-se-sua-ideia-esta-em-risco', only: [:index, :new, :create]

  get '*path', to: 'pages#404', via: :all
end
