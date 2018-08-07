require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order.rb')
also_reload ('./models/*')

# INDEX
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb (:index)
end

# NEW
get '/pizza-orders/new' do
  erb (:new)
end

# SHOW
get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb (:show)
end

# CREATE
post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

post '/pizza-orders/delete/:id' do
  @order = PizzaOrder.find(params[:id])
  @order.delete()
  erb(:delete)
end

get '/pizza-orders/update/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:update)
end

post '/pizza-orders/update/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  redirect "http://localhost:4567/pizza-orders"
end



# post '/pizza-orders/update/:id' do
#   @order = PizzaOrder.find(params[:id])
#   @order.first_name = params[:first_name]
#   @order.last_name = params[:last_name]
#   @order.topping = params[:topping]
#   @order.quantity = params[:quantity]
#   @order.update()
#   erb(:update)
# end
