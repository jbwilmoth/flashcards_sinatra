
animals = Deck.create(name: "Animals")
  animals.cards << Card.create(question: "What goes go 'Woof'?", answer:"Dog")
  animals.cards << Card.create(question: "What goes go 'Oink'?", answer:"Pig")

cereals = Deck.create(name: "Cereals")
  cereals.cards << Card.create(question: "Honeynut cheerio's spokes-animal?", answer:"Bee")
  cereals.cards << Card.create(question: "Who wants the trix?", answer:"Rabbit")

user1 = User.create(first_name: "Test", last_name: "Icle", email: "me@email.com", password: "123")
