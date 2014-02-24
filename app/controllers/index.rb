get '/' do
  @deck_names = []
  Deck.all.each{|deck| @deck_names << deck.name}
  erb :index
end

get '/create_user' do
  erb :create_user
end

get '/profile_page' do
  @user = User.find(session[:current_user])
  @high_scores = Score.where(user_id: @user.id).order('score').reverse
  erb :profile_page
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/end' do
  if params[:quit]
    redirect '/'
  elsif params[:replay]
    session[:current_score] = 0
    session[:correct] = nil
    erb :start
  end
end

get '/:deck_name/start' do
  session[:deck_name] = params[:deck_name]
  session[:correct] = nil
  session[:current_score] = 0
  erb :start
end

get '/:deck_name/end' do
  @deck = Deck.find_by_name(params[:deck_name])
  erb :end
end

get "/:deck_name/:card_number" do
  @deck = Deck.find_by_name(params[:deck_name]).cards
  @score = session[:current_score]
  erb :game_play
end



#We can store the decks, scores, other things in the session
#POST===========================================

post '/validate_user' do
  @deck_names = []
  Deck.all.each{|deck| @deck_names << deck.name}

  @user = User.find_by_email(params[:email])

  if session[:current_user]

    @two_users = true 
    if session[:current_user] == @user.id
      @same_user = true
      @two_users = false
    end

    erb :index
  elsif @user
    if @user.authenticate(params[:password])
      session[:current_user] = @user.id
      redirect '/profile_page'
    else
      @wrong_password = true
      @no_user = false
      erb :index
    end
  else
    @wrong_password = false
    @no_user = true
    erb :index
  end
end


post '/creation/validate_user' do
  @deck_names = []
  Deck.all.each{|deck| @deck_names << deck.name}

  @user = User.new(params[:user])
  if @user.save

    session[:current_user] = @user.id
    redirect '/profile_page'
  else
    @errors = true
    erb :create_user
  end
end

post "/:deck_name/:card_number" do
  @deck = Deck.find_by_name(params[:deck_name]).cards
  @num = params[:card_number].to_i
  card = Card.find_by_question(params[:question])

  if params[:answer].downcase == card.answer.downcase
    @num += 1
    session[:current_score] += 1
    session[:correct] = true
  else
    @num += 1
    session[:correct] = false
    session[:right_answer] = card.answer    
  end

  if @num >= @deck.length
    if session[:current_user]
      Score.create(deck_name: params[:deck_name], user_id: session[:current_user], score: session[:current_score])
    end
    redirect "/#{params[:deck_name]}/end"
  else
    redirect "/#{params[:deck_name]}/#{@num}"
  end
end
