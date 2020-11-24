  
30.times do
  Todo.create!([{
    content: Faker::Quote.famous_last_words,
    complete: false
  }])
end
