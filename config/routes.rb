PubQuiz::Application.routes.draw do

  # User session management
  get '/auth/:provider/callback', to: 'sessions#create', as: 'signin'
  get '/auth/failure', to: redirect('/')
  get '/signout', to: 'sessions#destroy', as: 'signout'
  get 'sessions/create'

  # bespoke routes
  get 'home/index'
  get 'how_it_works', to: 'home#how_it_works', as: :how_it_works


  namespace :api do # for the iOS / Android apps
    # Getting started / signed in / joined onto an event and team
    resources :events, only: [:index, :show, :create]
    resources :players, only: [:create]
    resources :teams, only: [:index, :create, :update]

    # playing
    resources :game_statistics, only: [:index, :show]
    resources :quiz_answers, only: [:create]
  end


  # Standard resources-based routes
  resources :question_categories
  # resources :users


  # Root route
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

end
