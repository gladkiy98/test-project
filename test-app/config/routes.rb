Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  authenticated :user do
    root 'posts#index', as: :authenticated_root
	  resources :posts
  end

  root to: redirect('/users/sign_in')

end
