get '/' do
  @deck_names = []
  Deck.all.each{|deck| @deck_names << deck.name}
  erb :test_index
end

get '/start/:deck_name' do
  erb :test_start
end


get '/:deck_name' do

end
