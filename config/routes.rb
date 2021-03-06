Rails.application.routes.draw do

  get 'courses/create'

  get 'courses/update'

  get 'courses/index'

  get 'courses/destroy'

  # resources :registrations, only: %i(index)
  # resources :students, only: [] do
  #   resources :registrations, only: %i(destroy), shallow: true
  #   resources :courses, only: [] do
  #     resources :registrations, only: %i(create), shallow: true
  #   end
  # end

  devise_for :users, controllers: { registrations: "users/registrations" }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :student_contacts
  # You can have the root of your site routed with "root"
  root 'home#index'

  scope module: :parent do
    resource :basket, only: [:show]
    resource :registration, only: [:new, :create, :show]
  end

  get '/admin', to: 'admin/home#index'
  scope module: :admin do
    resources :courses
    resources :approvals, only: [:index]
    resources :terms
  end

  resources :home
  resources :students
  resources :student_contacts
  resources :people

  get 'parent/courses', to:'parent/courses#index', as: :course_selection
  post 'approvals/:registration_item_id/update_status', to:'admin/approvals#update_status', as: :update_status
  post 'add_basket_item/:course_id', to: 'parent/courses#add_basket_item', as: :add_basket_item
  post 'remove_basket_item/:course_id', to: 'parent/courses#remove_basket_item', as: :remove_basket_item
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
