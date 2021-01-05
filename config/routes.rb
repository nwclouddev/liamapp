Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "user/registrations" } 

  resources :qrs

  resources 'ahoy_events', only: [:index, :destroy]

  resources 'ahoy_visits', only: [:index, :destroy]
  
  resources :bins
  
  resources :articles

  resources :delayed_jobs, only: :index

  resources :categories

  resources :eqp_object_categories do
    collection do
      post :import
    end
  end

  resources :eqp_object_classes do
    collection do
      post :import
    end
  end

  resources :eqp_object_category, only: [] do
    resources :eqp_profiles, only: :index
  end

  resources :eqp_object_criticalities

  resources :eqp_object_statuses

  resources :eqp_objects do
    collection do
      post :import
    end
  end
  

  resources :eqp_profiles do
    collection do
      post :import
    end
  end

  resources :event_components

  resources :event_eqp_groups

  resources :event_failures

  resources :event_priorities

  resources :event_problems

  resources :event_statuses

  resources :event_types

  resources :events do
    resources :comments, module: :events
    resources :labor_hours, module: :events
  end

  resources :functional_areas

  resources :ioq

  resources :lane_types

  resources :manufacturers do
    collection do
      post :import
    end
  end

  resources :organizations do
    collection do
      post :import
    end
  end

  resources :parts do
    resources :stores
  end

  resources :part_classes

  resources :part_uoms

  resources :pm_schedules do
    collection do
      post :import
    end
  end

  resources :pm_schedule_eqp_objects do
    collection do
      post :import
    end
  end

  resources :purchase_orders

  resources :stores

  resources :store_parts

  resources :suppliers

  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'dashboard', to: 'pages#dashboard'
  get 'forecast', to: 'pm_schedule_eqp_objects#forecast'
  get 'pm_resources', to: 'pm_schedule_eqp_objects#pm_resources'
  get 'pm_events', to: 'pm_schedule_eqp_objects#pm_events'
  resources :users

  authenticated :user do
    root to: 'ioq#index', as: :authenticated_root
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  
end
