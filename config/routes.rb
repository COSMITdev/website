Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /pt-BR|en/ do
    constraints subdomain: '' do
      match '/', to: 'pages#home', as: :root, via: 'get'
    end

    constraints subdomain: 'mvp' do
      match '/', to: 'pages#mvp', as: :mvp, via: 'get'
    end

    constraints subdomain: 'course' do
      match '/', to: 'pages#course', as: :course, via: 'get'
      post 'subscription', to: 'pages#subscription', as: :subscription
    end

    localized do
      get 'work',      to: 'pages#works',    as: :work
      get 'services',  to: 'pages#services', as: :service
      get '404',       to: 'pages#404',      as: :not_found
      post 'contact',  to: 'pages#contact',  as: :contact

      resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]
    end
  end

  # Keep this always at the end of file to grab 404 problems
  # get '*path', to: 'pages#404', via: :all
end
