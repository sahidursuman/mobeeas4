Rails.application.routes.draw do
  resources :feedbacks
  resources :expression_of_interests do
    member do
      get :notify, :approve
    end
  end
  resources :subscription_packs do
    collection do
      get :update_gst_rate_for
    end
  end
  resources :subscriptions do
    member do
      get :notify_expiring
    end
  end
  resources :sponsors
  resources :admins
  resources :admins
  resources :opportunity_school_years
  resources :reports
  resources :engagements do
    member do
      get :invite, :accept, :apply_a_token_to
    end
  end
  resources :engagement_token_packs do
    collection do
      get :update_gst_rate_for
    end
  end
  resources :payments, only: :create
  resources :token_purchases
  resources :opportunity_times
  resources :school_years
  resources :org_users do
    member do
      get :verified_and_admin_approved, :verified_host
    end
  end

  resources :org_user_profiles do
    member do
      get :approve, :prohibit
    end
  end

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
      get :increase_one_token_into,
      :decrease_one_token_from,
      :increase_one_token_into_independent,
      :decrease_one_token_from_independent,
      :status_draft,
      :status_listed,
      :post_active,
      :status_archived,
      :purchase_more_tokens_for,
      :contact_candidate_for,
      :contact_host_for
    end
  end
  resources :organisations do
    member do
      get :remove_host_from, :add_admin_into, :add_host_into, :contact_host_of
    end
  end
  resources :organisation_types
  resources :security_checks do
    member do
      get :verify
    end
  end
  resources :skills do
    member do
      get :add_user, :remove_user, :add_required, :remove_required, :admin_approves_new, :find_opportunities
    end
  end
  resources :skill_categories
  resources :educations do
    member do
      get :verify_candidate
    end
  end
  resources :profiles do
    member do
      get :approve, :prohibit
    end
  end

  get 'admin_page', to: 'pages#admin_page'
  get 'contact', to: 'pages#contact'
  get 'welcome', to: 'pages#welcome'
  get 'find_organisation', to: 'pages#find_organisation'
  root 'pages#home'
  get 'my_skills', to: 'pages#my_skills'
  get 'thanks', to: 'pages#thanks'
  get 'faqs', to: 'pages#faqs'
  get 'host_profile', to: 'pages#host_profile'
  get 'candidate_profile', to: 'pages#candidate_profile'
  get 'organisations_host', to: 'pages#organisations_host'
  get 'organisations_candidate', to: 'pages#organisations_candidate'
  get 'purchase_tokens', to: 'pages#purchase_tokens'
  get 'required_skills', to: 'pages#required_skills'
  get 'candidate_reports', to: 'pages#candidate_reports'
  get 'admin_candidates', to: 'pages#admin_candidates'
  get 'admin_hosts', to: 'pages#admin_hosts'
  get 'admin_sponsors', to: 'pages#admin_sponsors'
  get 'unverified_education', to: 'pages#unverified_education'
  get 'unverified_wwc', to: 'pages#unverified_wwc'
  get 'independent_host', to: 'pages#independent_host'
  get 'income', to: 'pages#income'
  get 'search_opportunities', to: 'pages#search_opportunities'
  get 'my_roles', to: 'pages#my_roles'
  get 'contact_candidate', to: 'pages#contact_candidate'
  get 'candidate_profile_mini', to: 'pages#candidate_profile_mini'



  # This path is used to redirec user to a specific page on successful sign up (registration)
  devise_for :users, controllers: { registrations: "registrations" }


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
