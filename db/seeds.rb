# User.create!(email: 'admin@example.com', password: '123456', password_confirmation: '123456')  
30.times do
  Todo.create!([{
    content: Faker::Quote.famous_last_words,
    complete: false,
    user_id: User.first.id
  }])
end
