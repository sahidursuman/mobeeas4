Rails.application.routes.draw do
  resources :org_users do
    member do
      get :verified_and_admin_approved
    end
    member do
      get :verified
    end
  end

  resources :org_user_profiles

  resources :skill_verifications do
    member do
      get :approve
    end
  end
  resources :enquiries
  resources :agreements do
    member do
      get :agree_to
    end
  end
  resources :candidate_types
  resources :opportunity_applications
  resources :opportunities
  resources :organisations do
    member do
      get :remove_host_from
    end
  end
  resources :organisation_types
  resources :security_checks
  resources :skills do
    member do
      get :add_user, :remove_user
    end
  end
  resources :skill_categories
  resources :educations do
    member do
      get :verify
    end
  end
  resources :profiles
  get 'admin', to: 'pages#admin'
  get 'contact', to: 'pages#contact'
  get 'welcome', to: 'pages#welcome'
  get 'find_organisation', to: 'pages#find_organisation'
  root 'pages#home'
  get 'my_skills', to: 'pages#my_skills'
  get 'thanks', to: 'pages#thanks'
  get 'thanks2', to: 'pages#thanks2'
  get 'about', to: 'pages#about'
  get 'dashboard_host', to: 'pages#dashboard_host'
  get 'dashboard_candidate', to: 'pages#dashboard_candidate'
  get 'dashboard_sponsor', to: 'pages#dashboard_sponsor'


  devise_for :users
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
