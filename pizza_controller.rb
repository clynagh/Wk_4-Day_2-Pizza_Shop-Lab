require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')

#INDEX
get '/pizzas' do
  @pizzas = Pizza.all
  erb(:index)
end

#NEW
get '/pizzas/new' do
  erb(:new)
end

#SHOW
get '/pizzas/:id' do
  @pizza = Pizza.find(params[:id])
  erb(:show)
end

#CREATE
post '/pizzas' do
  pizza = Pizza.new(params)
  pizza.save
  redirect to "/pizzas/#{pizza.id}"
end

#EDIT
get '/pizzas/:id/edit' do
  @pizza = Pizza.find(params[:id])
  erb(:edit)
end


# UPDATE
post '/pizzas/:id' do
  Pizza.new(params).update
  redirect to '/pizzas'
end

# #DESTROY
# post '/pizzas/:id/delete' do


# end

