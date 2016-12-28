Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :contacts, :path => '' do
    resources :mail_messages, :only => :deliver do
      collection do
        post :deliver
      end
    end
  end

  # Admin routes
  namespace :contacts, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :contacts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
