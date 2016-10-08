Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /pt-BR|en/ do
    root 'pages#home'
  end

  localized do
    get '404',                        to: 'pages#404',             as: :not_found
    get 'work',                       to: 'pages#works',           as: :work
    get 'course',                     to: 'course#index',          as: :course
    get 'mvpslim',                    to: 'mvp#index',             as: :mvp
    get 'services',                   to: 'pages#services',        as: :service
    get 'startups',                   to: 'startups#index',        as: :startups
    get 'startups/validation-course', to: 'startups#validation',   as: :validation
    get 'startups/strategy-call',     to: 'startups#strategycall', as: :strategy_call
    get 'startups/mvp-concierge',     to: 'startups#mvpconcierge', as: :mvp_concierge
    get 'startups/mvp-slim',          to: 'startups#mvpslim',      as: :mvp_slim

    post 'contact', to: 'contacts#create',  as: :contact
    post 'subscribe', to: 'subscribers#create',  as: :subscribe

    resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]
    resource :contact, only: :create
    resource :subscription, only: [:create, :destroy]
  end

  get '*path', to: 'pages#404', via: :all
end
