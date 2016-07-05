Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope '(:locale)', locale: /pt-BR|en/ do
    constraints subdomain: '' do
      # For some unknown reason this routes don't work
      # when declared as 'root to'
      match '/', to: 'pages#home', as: :root, via: 'get'
    end

    constraints subdomain: 'mvp' do
      # For some unknown reason this routes don't work
      # when declared as 'root to'
      match '/', to: 'mvp#index', as: :mvp, via: 'get'
    end

    constraints subdomain: 'course' do
      # For some unknown reason this routes don't work
      # when declared as 'root to'
      match '/', to: 'subscriptions#index', as: :course, via: 'get'
      get 'unsubscribe', to: 'subscriptions#unsubscribe', as: :unsubscribe
      get 'next', to: 'subscriptions#next', as: :next_newsletter
    end

    localized do
      get 'work',      to: 'pages#works',    as: :work
      get 'services',  to: 'pages#services', as: :service
      get '404',       to: 'pages#404',      as: :not_found

      resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]
    end

    # This routes don't need to be translated
    # and do not try to put them inside constraints
    # won't gonna work...
    resource :contact, only: :create
    resource :subscription, only: [:create, :destroy]
  end

  # Keep this always at the end of file to grab 404 problems
  # get '*path', to: 'pages#404', via: :all
end
