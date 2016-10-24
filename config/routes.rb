Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  get 'descubra-se-sua-ideia-esta-em-risco',  to: 'quiz#quiz1',            as: :quiz1
  get 'servicos',                             to: 'pages#services',        as: :service
  get 'trabalhos',                            to: 'pages#works',           as: :work
  post 'contato',                             to: 'contacts#create',       as: :contact
  post 'inscricao',                           to: 'subscribers#create',    as: :subscribe
  post 'newsletter',                          to: 'newsletter#create',     as: :newsletter

  resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]

  get '*path', to: 'pages#404', via: :all
end
