Proj2::Application.routes.draw do
   
  get "suggestions/edit"
  get "suggestions/update"
  
  match "pages/login", :via => [:get,:post]
  get "pages/logout"
  root :to => "pages#login"
  match "pages/continue" => "pages#continue"
  get "users/new"
  match 'users/create' => 'users#create' 
  get "users/edit"
  match "users/edit" => "users#edit"
  match "users/update" => "users#update"
  match "users/chooseUser" => "users#chooseUser"
  get "users/index"
  match "users" => "users#index"
  match 'users/resetPass' => 'users#resetPass'
  match 'users/updatePass' => 'users#updatePass'
  #match 'users/updatePassSuccess' => 'users#updatePassSuccess'
  match 'users/resetPassResult' => 'users#resetPassResult'
  
  match 'suggestions/update' => 'suggestions#update'
  match 'user_suggestions' => 'user_suggestions#index'
  match 'user_suggestions/new' => 'user_suggestions#new'
  match 'user_suggestions/create' => 'user_suggestions#create'
  match 'user_suggestions/chooseSuggestion' => 'user_suggestions#chooseSuggestion'
  match 'user_suggestions/edit' => 'user_suggestions#edit'
  match 'user_suggestions/divChairView/' => 'user_suggestions#divChairView'
  match 'user_suggestions/depView/' => 'user_suggestions#depView'
  #match 'user_suggestions/proj2.html' => 'user_suggestions#index'  #TEST FOR FLEX
  match '/history/history.css' => 'user_suggestions#suggestion'
  match '/history/history.js' => 'user_suggestions#suggestion'
  match '/swfobject.js' => 'user_suggestions#suggestion'
  match 'user_suggestions/indexSortByDiv' => 'user_suggestions#indexSortByDiv'
  match 'user_suggestions/indexSortByDep' => 'user_suggestions#indexSortByDep'
  match 'user_suggestions/indexSortByName' => 'user_suggestions#indexSortByName'
  match 'user_suggestions/indexSortByDiv' => 'user_suggestions#indexSortByDiv'
  match 'user_suggestions/indexSortByCreate' => 'user_suggestions#indexSortByCreate'
  match 'user_suggestions/indexSortByMod' => 'user_suggestions#indexSortByMod'
  match 'user_suggestions/chooseSurveySugg' => 'user_suggestions#chooseSurveySugg'
  match 'user_suggestions/survey' => 'user_suggestions#survey'
  #match 'user_suggestions/suggestion.html' => 'user_suggestions#suggestion'  #TEST FOR FLEX
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
