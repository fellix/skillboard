Rails.application.routes.draw do
  root to: "home#show"

  post '/companies/match' => 'companies#match'
end
