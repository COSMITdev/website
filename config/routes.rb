Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /pt-BR|en/ do
    root 'pages#home'
  end

  localized do
    get 'work',      to: 'pages#works',    as: :work
    get 'services',  to: 'pages#services', as: :service
    get '404',       to: 'pages#404',      as: :not_found
    post 'contact',  to: 'pages#contact',  as: :contact
    get 'mvpslim',       to: 'mvp#index',      as: :mvp

    resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]
    resource :contact, only: :create
    resource :subscription, only: [:create, :destroy]
  end

  get '*path', to: 'pages#404', via: :all
end
