Spree::Core::Engine.routes.append do

  namespace :admin do
    resources :option_values do
      collection do
        post :update_positions
      end
    end

    resources :products do
      resources :variants do
        collection do
          post :generate_for_option_types
        end
      end
    end

  end

end
