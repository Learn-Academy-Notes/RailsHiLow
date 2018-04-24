Rails.application.routes.draw do
  get "/answers" => "game#try"
  get "/reset" => "game#restart"
  get "/check_password" => "password#check"
end
