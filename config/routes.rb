Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  get 'servicos',    to: 'pages#services',     as: :service
  get 'trabalhos',   to: 'pages#works',        as: :work
  get 'protocamp',   to: 'protocamp#index',    as: :protocamp
  post 'contato',    to: 'contacts#create',    as: :contact
  post 'inscricao',  to: 'subscribers#create', as: :subscribe
  post 'newsletter', to: 'newsletter#create',  as: :newsletter
  post 'protocamp',  to: 'protocamp#create'

  resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]
  resources :quizzes, path: 'descubra-se-sua-ideia-esta-em-risco', only: [:index, :create]

  get 'descubra-se-sua-ideia-esta-em-risco/quiz', to: 'quizzes#new', as: :new_quiz
  get '*path', to: 'pages#404', via: :all
end
