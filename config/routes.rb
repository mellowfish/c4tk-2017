Rails.application.routes.draw do
  get "/styles/base.css" => redirect("/pages/styles/base.css")
  get "/scripts/base.js" => redirect("/pages/scripts/base.js")

  resources :songs do
    resources :lyrics do
      collection do
        get "import" => "lyrics#raw_new", as: :raw_new
        post "import" => "lyrics#raw_create", as: :raw_create
        get "edit_all" => "lyrics#edit_all", as: :edit_all
        match "destroy_all" => "lyrics#destroy_all", as: :destroy_all, via: [:get, :delete]
      end
    end

    resource :verse_references do
      collection do
        match "destroy_general" => "verse_references#destroy_general", as: :destroy_general, via: [:get, :delete]
      end
    end
  end
end
