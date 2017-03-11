Rails.application.routes.draw do
  resources :songs do
    resources :lyrics do
      collection do
        get "import" => "lyrics#raw_new", as: :raw_new
        post "import" => "lyrics#raw_create", as: :raw_create
        get "edit_all" => "lyrics#edit_all", as: :edit_all
        match "destroy_all" => "lyrics#destroy_all", as: :destroy_all, via: [:get, :delete]
      end
    end
  end
end
