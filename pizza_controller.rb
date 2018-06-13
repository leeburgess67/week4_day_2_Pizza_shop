require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order.rb')
also_reload('./models/*')

#index
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb( :index )
end




#new
get '/pizza-orders/new' do
  erb( :new )
end

#show
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i())
  erb( :show )
end

#CREATE
post '/pizza-orders' do
 @order = PizzaOrder.new(params)
 @order.save()
 erb ( :create )
end


#delete

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete
  redirect '/pizza-orders' #form posting to delete route
end
