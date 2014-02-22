get '/' do
  @deck_names = []
  Deck.all.each{|deck| @deck_names << deck.name}
  erb :index
end

get '/:deck_name/start' do
  erb :start
end

get '/:deck_name/end' do
  erb :end
end

get "/:deck_name/:card_number" do
  @deck = Deck.find_by_name(params[:deck_name]).cards
  erb :game_play
end


#POST===========================================

post '/:deck_name/:card_number' do
  @deck = Deck.find_by_name(params[:deck_name]).cards
  @num = params[:card_number].to_i
  card = Card.find_by_question(params[:question])

  if params[:answer] == card.answer
    @deck_name = params[:deck_name]
    @num += 1
    if @num >= @deck.length
      redirect "/#{params[:deck_name]}/end"
    end
    erb :correct_answer
  else
    @correct = false
    erb :game_play
  end
end
