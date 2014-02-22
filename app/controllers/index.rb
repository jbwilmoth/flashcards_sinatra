get '/' do
  @deck_names = []
  Deck.all.each{|deck| @deck_names << deck.name}
  erb :index
end

get '/create_user' do
  erb :create_user
end

get '/home_page' do
  "signed in"
end

get '/end' do 
  if params[:quit]
    redirect '/'
  elsif params[:replay]
    erb :start
  end
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



#We can store the decks, scores, other things in the session
#POST===========================================
post '/stat/' do

end


post '/create_user' do
  User.create(params[:user])
  # binding.pry
  erb :creation_page
end


post '/:deck_name/:card_number' do
  @deck = Deck.find_by_name(params[:deck_name]).cards
  @num = params[:card_number].to_i
  card = Card.find_by_question(params[:question])

  if params[:answer].downcase == card.answer.downcase
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
