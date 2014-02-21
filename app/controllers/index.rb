get '/' do
  @deck_names = []
  Deck.all.each{|deck| @deck_names << deck.name}
  # binding.pry
  erb :test_index
end

get 'start' do

end
