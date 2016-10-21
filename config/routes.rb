Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'pages#home'

  get 'trabalhos',                    to: 'pages#works',           as: :work
  get 'servicos',                     to: 'pages#services',        as: :service
  # get 'course',                     to: 'course#index',          as: :course
  # get 'mvpslim',                    to: 'mvp#index',             as: :mvp
  # get 'startups',                   to: 'startups#index',        as: :startups
  # get 'startups/validation-course', to: 'startups#validation',   as: :validation
  # get 'startups/strategy-call',     to: 'startups#strategycall', as: :strategy_call
  # get 'startups/mvp-concierge',     to: 'startups#mvpconcierge', as: :mvp_concierge
  # get 'startups/mvp-slim',          to: 'startups#mvpslim',      as: :mvp_slim
  post 'contato',                     to: 'contacts#create',       as: :contact
  post 'inscricao',                   to: 'subscribers#create',    as: :subscribe
  post 'newsletter',                  to: 'newsletter#create',     as: :newsletter

  resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]

  get '*path', to: 'pages#404', via: :all
end
