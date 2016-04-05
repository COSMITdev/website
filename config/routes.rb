Rails.application.routes.draw do
  scope '(:locale)', locale: /pt-BR|en/ do
    root 'pages#home'
    post 'contato', to: 'pages#contact', as: :contact

    get 'trabalhos', to: 'pages#works',    as: :work
    get 'servicos',  to: 'pages#services', as: :service
    get '404',       to: 'pages#404',      as: :not_found

    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
  end

  resources :posts, controller: 'blog', path: 'blog', only: [:index, :show]

  # Keep this always at the end of file to grab 404 problems
  get '*path', to: 'pages#404', via: :all
end
