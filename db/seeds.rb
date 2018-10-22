#-----------------SEED DATA--------------#

#Users:
User.create(name: "Ryan", password: "12345")
User.create(name: "Dan", password: "12345")
User.create(name: "Steve", password: "12345")
User.create(name: "John", password: "12345")
User.create(name: "Ollie", password: "12345")
User.create(name: "Amalie", password: "12345")
User.create(name: "Sang", password: "12345")
User.create(name: "Barney", password: "12345")

#Categories:
Category.create(name: "Science")
Category.create(name: "History")
Category.create(name: "Geography")
Category.create(name: "Politics")
Category.create(name: "Medicine")
Category.create(name: "Sports")
Category.create(name: "TV")
Category.create(name: "Movies")
Category.create(name: "Games")


#---------------------------------------------#
#-------------Questions & Answers-------------#
#---------------------------------------------#

#Question 1.
Question.create(content: "What shape is the earth?", category_id: 1)
#Answers:
Answer.create(question_id: 1, answer: "Round", correct: false)
Answer.create(question_id: 1, answer: "Flat", correct: true)
Answer.create(question_id: 1, answer: "Square", correct: false)
Answer.create(question_id: 1, answer: "Triangle", correct: false)


#Question 2.
Question.create(content: "What is the composition of water?", category_id: 1)
#Answers:
Answer.create(question_id: 2, answer: "H20", correct: false)
Answer.create(question_id: 2, answer: "C02", correct: true)
Answer.create(question_id: 2, answer: "H", correct: false)
Answer.create(question_id: 2, answer: "H202", correct: false)


#Question 3.
Question.create(content: "When did WW2 end?", category_id: 2)
#Answers:
Answer.create(question_id: 3, answer: "1872", correct: false)
Answer.create(question_id: 3, answer: "1990", correct: false)
Answer.create(question_id: 3, answer: "1945", correct: true)
Answer.create(question_id: 3, answer: "1213", correct: false)


#Question 4.
Question.create(content: "Who invented the cannon?", category_id: 2)
#Answers:
Answer.create(question_id: 4, answer: "Walter White", correct: false)
Answer.create(question_id: 4, answer: "Rico Suave", correct: false)
Answer.create(question_id: 4, answer: "Ryan Barker", correct: true)
Answer.create(question_id: 4, answer: "Sammy The Snake", correct: false)


#Question 5.
Question.create(content: "What is the capital of Slovakia?", category_id: 3)
#Answers:
Answer.create(question_id: 5, answer: "Bratislava", correct: true)
Answer.create(question_id: 5, answer: "Burne", correct: false)
Answer.create(question_id: 5, answer: "Bouji", correct: false)
Answer.create(question_id: 5, answer: "Stalinostovic", correct: false)


#Question 6.
Question.create(content: "What is the stretch of water between Britain and France called?", category_id: 3)
#Answers
Answer.create(question_id: 6, answer: "Splash Town", correct: false)
Answer.create(question_id: 6, answer: "Hinchley Glacier", correct: false)
Answer.create(question_id: 6, answer: "Languna Beach", correct: false)
Answer.create(question_id: 6, answer: "The Channel", correct: true)


#Question 7.
Question.create(content: "What is Theresa May's favourite dance?", category_id: 4)
#Answers:
Answer.create(question_id: 7, answer: "Ballroom", correct: false)
Answer.create(question_id: 7, answer: "The Cha Cha", correct: false)
Answer.create(question_id: 7, answer: "Bump and Grind", correct: true)
Answer.create(question_id: 7, answer: "Cakewalk", correct: false)


#Question 8.
Question.create(content: "How much did Winston Churchill weigh in his prime?", category_id: 4)
#Answers
Answer.create(question_id: 8, answer: "80kg", correct: false)
Answer.create(question_id: 8, answer: "120kg", correct: false)
Answer.create(question_id: 8, answer: "160kg", correct: false)
Answer.create(question_id: 8, answer: "180kg", correct: true)


#Games:
Game.create(user_id: 1, category_id: 1, score: 700)
Game.create(user_id: 2, category_id: 1, score: 400)
Game.create(user_id: 3, category_id: 2, score: 900)
Game.create(user_id: 4, category_id: 4, score: 200)
