get '/' do
  @deck_names = []
  Deck.all.each{|deck| @deck_names << deck.name}
  erb :test_index
end

get '/start/:deck_name' do
  erb :test_start
end


get '/:deck_name' do
  @deck = Deck.find_by_name(params[:deck_name]).cards
  @deck_name = @deck.name
  erb :test_game
end

get '/:deck_name/end' do

end
#POST===========================================


post '/:deck_name' do


end
