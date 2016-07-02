Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /pt-BR|en/ do
    match '/', to: 'pages#home', constraints: { subdomain: '' }, as: :root, via: 'get'
    match '/', to: 'pages#mvp', constraints: { subdomain: /.+/ }, as: :mvp, via: 'get'

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
