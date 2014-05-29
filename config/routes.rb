Rails.application.routes.draw do
  root 'home#index'

  resources :hospitals do
    member do
      get :doctor
      post :add_doctor
    end
  

    resources :patients do
      resources :medicines
      collection do
        get :search_names
      end
      member do
        get :new_doctor
        post :add_doctor
        patch :waiting
        patch :doctor
        patch :xrays
        patch :surgery
        patch :paybill
        patch :leaving
        get :waiting
        get :doctor
        get :xrays
        get :surgery
        get :paybill
        get :leaving
        get :discharge
      end
    end
  end
end
