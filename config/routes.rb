Rails.application.routes.draw do
  root :to => 'rpc#execute', :via => :post, :format => :json
end
