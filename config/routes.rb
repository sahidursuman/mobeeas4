Rails.application.routes.draw do
  resources :reports
  resources :messages
  resources :engagements do
    member do
      get :short_list, :invite, :accept, :apply_a_token_to
    end
  end
  resources :engagement_token_packs
  resources :payments, only: :create
  resources :token_purchases
  resources :opportunity_times
  resources :school_years
  resources :org_users do
    member do
      get :verified_and_admin_approved, :verified_host
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
  resources :opportunities do
    member do
      get :increase_one_token_into, :decrease_one_token_from, :status_draft, :status_listed, :post_active, :status_archived
    end
  end
  resources :organisations do
    member do
      get :remove_host_from, :add_admin_into, :add_host_into
    end
  end
  resources :organisation_types
  resources :security_checks
  resources :skills do
    member do
      get :add_user, :remove_user, :add_required, :remove_required
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
  get 'thanks3', to: 'pages#thanks3'
  get 'about', to: 'pages#about'
  get 'host_profile', to: 'pages#host_profile'
  get 'candidate_profile', to: 'pages#candidate_profile'
  get 'organisations_host', to: 'pages#organisations_host'
  get 'organisations_candidate', to: 'pages#organisations_candidate'
  get 'purchase_tokens', to: 'pages#purchase_tokens'
  get 'required_skills', to: 'pages#required_skills'
  get 'conversations', to: 'pages#conversations'





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
