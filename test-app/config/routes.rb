Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations', :omniauth_callbacks => "callbacks" }

  authenticated :user do
    root 'posts#index', as: :authenticated_root
	  resources :posts do
	  	member do
	  		put "like" => "posts#upvote"
	  		put "unlike" => "posts#downvote"
	  	end
	  end
  end

  root to: redirect('/users/sign_in')

end
