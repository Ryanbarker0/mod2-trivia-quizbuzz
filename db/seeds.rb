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
Category.create(name: "General Knowledge")
Category.create(name: "Science & Nature")
Category.create(name: "Computers")
Category.create(name: "Music")
Category.create(name: "Movies")
Category.create(name: "Video Games")
Category.create(name: "History")
Category.create(name: "Anime")
Category.create(name: "Animals")
Category.create(name: "Geography")
Category.create(name: "Politics")
Category.create(name: "Books")
Category.create(name: "Sports")
Category.create(name: "Vehicles")
Category.create(name: "Celebrities")

#---------------------------------------------#
#-------------Questions & Answers-------------#
#---------------------------------------------#

# #Question 1.
# Question.create(content: "What shape is the earth?", category_id: 1)
# #Answers:
# Answer.create(question_id: 1, content: "Round", correct: false)
# Answer.create(question_id: 1, content: "Flat", correct: true)
# Answer.create(question_id: 1, content: "Square", correct: false)
# Answer.create(question_id: 1, content: "Triangle", correct: false)
#
#
# #Question 2.
# Question.create(content: "What is the composition of water?", category_id: 1)
# #Answers:
# Answer.create(question_id: 2, content: "H20", correct: false)
# Answer.create(question_id: 2, content: "C02", correct: true)
# Answer.create(question_id: 2, content: "H", correct: false)
# Answer.create(question_id: 2, content: "H202", correct: false)
#
#
# #Question 3.
# Question.create(content: "When did WW2 end?", category_id: 1)
# #Answers:
# Answer.create(question_id: 3, content: "1872", correct: false)
# Answer.create(question_id: 3, content: "1990", correct: false)
# Answer.create(question_id: 3, content: "1945", correct: true)
# Answer.create(question_id: 3, content: "1213", correct: false)
#
#
# #Question 4.
# Question.create(content: "Who invented the cannon?", category_id: 1)
# #Answers:
# Answer.create(question_id: 4, content: "Walter White", correct: false)
# Answer.create(question_id: 4, content: "Rico Suave", correct: false)
# Answer.create(question_id: 4, content: "Ryan Barker", correct: true)
# Answer.create(question_id: 4, content: "Sammy The Snake", correct: false)
#
#
# #Question 5.
# Question.create(content: "What is the capital of Slovakia?", category_id: 1)
# #Answers:
# Answer.create(question_id: 5, content: "Bratislava", correct: true)
# Answer.create(question_id: 5, content: "Burne", correct: false)
# Answer.create(question_id: 5, content: "Bouji", correct: false)
# Answer.create(question_id: 5, content: "Stalinostovic", correct: false)
#
#
# #Question 6.
# Question.create(content: "What is the stretch of water between Britain and France called?", category_id: 1)
# #Answers
# Answer.create(question_id: 6, content: "Splash Town", correct: false)
# Answer.create(question_id: 6, content: "Hinchley Glacier", correct: false)
# Answer.create(question_id: 6, content: "Languna Beach", correct: false)
# Answer.create(question_id: 6, content: "The Channel", correct: true)
#
#
# #Question 7.
# Question.create(content: "What is Theresa May's favourite dance?", category_id: 1)
# #Answers:
# Answer.create(question_id: 7, content: "Ballroom", correct: false)
# Answer.create(question_id: 7, content: "The Cha Cha", correct: false)
# Answer.create(question_id: 7, content: "Bump and Grind", correct: true)
# Answer.create(question_id: 7, content: "Cakewalk", correct: false)
#
#
# #Question 8.
# Question.create(content: "How much did Winston Churchill weigh in his prime?", category_id: 1)
# #Answers
# Answer.create(question_id: 8, content: "80kg", correct: false)
# Answer.create(question_id: 8, content: "120kg", correct: false)
# Answer.create(question_id: 8, content: "160kg", correct: false)
# Answer.create(question_id: 8, content: "180kg", correct: true)
#
# #Question 9.
# Question.create(content: "Where is the best place to hide a fart?", category_id: 1)
# #Answers
# Answer.create(question_id: 9, content: "A Jar", correct: false)
# Answer.create(question_id: 9, content: "Cushion", correct: false)
# Answer.create(question_id: 9, content: "Mouth", correct: false)
# Answer.create(question_id: 9, content: "Water Balloon", correct: true)
#
# #Question 10.
# Question.create(content: "How Much Does an Elephant Penis Cost?", category_id: 1)
# #Answers
# Answer.create(question_id: 10, content: "One hair past a freckle", correct: false)
# Answer.create(question_id: 10, content: "A bucket of sand", correct: false)
# Answer.create(question_id: 10, content: "£50", correct: false)
# Answer.create(question_id: 10, content: "£1", correct: true)
#
# #Question 11.
# Question.create(content: "What do you get when you cross a wallet with a hose?", category_id: 1)
# #Answers
# Answer.create(question_id: 11, content: "A fish bowl", correct: false)
# Answer.create(question_id: 11, content: "The moon", correct: false)
# Answer.create(question_id: 11, content: "A point of view", correct: false)
# Answer.create(question_id: 11, content: "A race war", correct: true)


#Games:
Game.create(user_id: 1, category_id: 1, score: 300)
Game.create(user_id: 2, category_id: 1, score: 400)
Game.create(user_id: 3, category_id: 2, score: 900)
Game.create(user_id: 4, category_id: 4, score: 200)
Game.create(user_id: 1, category_id: 1, score: 300)
Game.create(user_id: 2, category_id: 1, score: 400)
Game.create(user_id: 3, category_id: 2, score: 900)
Game.create(user_id: 4, category_id: 4, score: 200)

Game.create(user_id: 1, category_id: 1, streak: 3)
Game.create(user_id: 2, category_id: 1, streak: 2)
Game.create(user_id: 3, category_id: 2, streak: 5)
Game.create(user_id: 4, category_id: 4, streak: 7)
Game.create(user_id: 1, category_id: 1, streak: 1)
Game.create(user_id: 2, category_id: 1, streak: 1)
Game.create(user_id: 3, category_id: 2, streak: 6)
Game.create(user_id: 4, category_id: 4, streak: 4)
