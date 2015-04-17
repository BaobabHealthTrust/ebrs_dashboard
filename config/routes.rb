Rails.application.routes.draw do

  root 'dashboard#index'

  get '/dashboard' => 'dashboard#index'

  get '/dashboard_counts' => 'dashboard#get_counts'

  get '/search_by_barcode/:id' => "hq#search_by_barcode"

  post '/push_merge' => "hq#push_merge"

  get '/query_to_print' => "hq#query_to_print"

  get '/birth_certificate/:id' => "hq#birth_certificate"

  post 'hq/do_print_these'

  post 'users/update_password'

  get 'users/change_password'

  get 'users/my_account'

  get '/search_by_case/:id' => "hq#search_by_case"

  get '/do_reopen_case/:id' => "hq#do_reopen_case"

  get '/do_close_case/:id' => "hq#do_close_case"

  get '/do_void_case/:id' => "hq#do_void_case"

  get 'hq/re_open_case'

  get 'hq/close_cases'

  get 'hq/void_cases'

  get 'hq/view_cases'

  get 'hq/view_closed_cases'

  get 'hq/view_requests'

  get 'hq/manage_duplicates'

  get 'hq/reports'

  get 'hq/print_certificates'

  get 'hq/list_voided_cases'

  get 'hq/manage_sites'

  get 'hq/index'
  
  get 'hq/validate_records'
  
  get 'hq/compare_demographics'

  get "/query_voided" => "children#query_voided"

  get "/query_requests" => "children#query_requests"

  get "/query_closed" => "children#query_closed"

  get "/query" => "children#query"

  get "/view" => "children#view"

  get "/search" => "children#search"

  get "/logout" => "logins#logout"

  get "/login" => "logins#login"

  get "/search_by_fullname/:id" => "children#search_by_fullname"

  get "/search_by_fullname" => "children#search_by_fullname"

  get "/set_context/:id" => "logins#set_context"

  get "/view_users" => "users#view"

  get "/query_users" => "users#query"

  get "/search_user" => "users#search"

  get "/search_by_username/:id" => "users#search_by_username"

  get "/search_by_username" => "users#search_by_username"

  get "/username_availability" => "users#username_availability"

  get "/block_user/:id" => "users#block_user"

  get "/unblock_user/:id" => "users#unblock_user"

  get "/block" => "users#block"

  get "/unblock" => "users#unblock"
  
  get "/case_validation" => "hq#compare_demographics"
  
  get "/validate_records" => "hq#validate_records"

  resources :children

  resources :users

  resource :login do
    collection do
      get :logout
    end
  end	

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
