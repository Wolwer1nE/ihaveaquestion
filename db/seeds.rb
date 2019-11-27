# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user1 = User.create(login: 'User_1')
user2 = User.create(login: 'User_2')
Question.create(title:'Не могу установить Rails!', body: 'Выпадает странная ошибка', user: user1)
question = Question.create(title:'Помогите с вебпакером', body: 'Я просто не знаю, зачем он нужен', user: user2)
question.answers.create(body: 'Webpacker собирает ассеты.', user: user1)