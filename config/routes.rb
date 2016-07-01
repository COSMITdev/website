Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /pt-BR|en/ do
    constraints subdomain: '' do
      root to: 'pages#home', as: :root
    end

    constraints subdomain: 'mvp' do
      root to: 'pages#mvp', as: :mvp
    end
  end

  localized do
    get 'work',      to: 'pages#works',    as: :work
    get 'services',  to: 'pages#services', as: :service
    get '404',       to: 'pages#404',      as: :not_found
    post 'contact',  to: 'pages#contact',  as: :contact

    resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]
  end
  # Keep this always at the end of file to grab 404 problems
  # get '*path', to: 'pages#404', via: :all
end
