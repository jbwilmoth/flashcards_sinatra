
animals = Deck.create(name: "Animals")
  animals.cards << Card.create(question: "What goes go 'Woof'?", answer:"Dog")
  animals.cards << Card.create(question: "What goes go 'Oink'?", answer:"Pig")
  animals.cards << Card.create(question: "What goes go 'Moo'?", answer:"Cow")
  animals.cards << Card.create(question: "What goes go 'Ow Ow Ow'?", answer:"Seal")
  animals.cards << Card.create(question: "What goes go 'Blub'?", answer:"Fish")


cereals = Deck.create(name: "Cereals")
  cereals.cards << Card.create(question: "Honeynut cheerio's spokes-animal?", answer:"Bee")
  cereals.cards << Card.create(question: "Who wants the trix?", answer:"Rabbit")
  cereals.cards << Card.create(question: "Who tastes magically delicious?", answer:"Leprechaun")
  cereals.cards << Card.create(question: "What makes the best holiday mix?", answer:"Chex")
  cereals.cards << Card.create(question: "What is the most metal of birthday presents?", answer:"NOTHING")


user1 = User.create(first_name: "Test", last_name: "Icle", email: "me@email.com", password: "123", password_confirmation: "123")
