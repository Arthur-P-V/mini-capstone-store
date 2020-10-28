Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/all_products" => "products#displayall"
    get "/spoon" => "products#spoon"
    get "/tape" => "products#tape"
    get "/chair" => "products#chair"
  end
end
