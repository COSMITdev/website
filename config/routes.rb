Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  get '/quiz/descubra-se-sua-ideia-esta-em-risco',  to: 'quiz#quiz1',            as: :quiz1
  get 'protocamp',                                  to: 'protocamp#index',       as: :protocamp
  get 'servicos',                                   to: 'pages#services',        as: :service
  get 'trabalhos',                                  to: 'pages#works',           as: :work
  get 'about',                                      to: 'pages#about',           as: :about
  post 'contato',                                   to: 'contacts#create',       as: :contact
  post 'inscricao',                                 to: 'subscribers#create',    as: :subscribe
  post 'newsletter',                                to: 'newsletter#create',     as: :newsletter

  resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]

  get '*path', to: 'pages#404', via: :all
end
