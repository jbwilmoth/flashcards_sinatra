get '/' do
  @deck_names = []
  Deck.all.each{|deck| @deck_names << deck.name}
  erb :index
end

get '/:deck_name/start' do
  erb :start
end

get '/:deck_name/end' do
  "You feeenished"
end

get '/:deck_name/:card_number' do
  @deck = Deck.find_by_name(params[:deck_name]).cards

  if params[:card_number].to_i >= @deck.length
    redirect "/#{params[:deck_name]}/end"
  end

  erb :game_play
end


#POST===========================================


post '/start/' do
  @name = params[:name]
  redirect '/start/#{@name}'


end

post '/:deck_name/:card_number' do
  # @card = Card.find_by_name()
  num = params[:card_number].to_i
  num += 1
  redirect "/#{params[:deck_name]}/#{num}"
end
