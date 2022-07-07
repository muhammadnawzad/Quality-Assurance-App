# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

role1 = Role.create(name: "QA-Engineer")
role2 = Role.create(name: "SW-Engineer")

user1 = User.create(email: "ranj.rashid@gmail.com", password: "ranj12345", role_id: role1.id)
user2 = User.create(email: "sarkazh.aram@gmail.com", password: "sarkazh12345", role_id: role2.id)
user3 = User.create(email: "zheman.wishyar@gmail.com", password: "zheman12345", role_id: role1.id)
user4 = User.create(email: "alend.botan@gmail.com", password: "alend12345", role_id: role1.id)
user5 = User.create(email: "didam.goran@gmail.com", password: "didam12345", role_id: role2.id)

question1 = Question.create(title: "What is the best way to learn Ruby?", content: "helloooooo there!", user_id: user1.id)
question2 = Question.create(title: "What are the common mistakes in Ruby?", content: "GGs", user_id: user4.id)
question3 = Question.create(title: "Is Ruby better than .NET?", content: "THOR!", user_id: user3.id)

answer1 = Answer.create(content: "Try to reads books that is natural to read and easy to understand.", question_id: question1.id, user_id: user2.id)
answer2 = Answer.create(content: "Focus on simplicity and productivity.", question_id: question1.id, user_id: user5.id)
answer4 = Answer.create(content: "Ruby is best to learn throught youtube.", question_id: question2.id, user_id: user5.id)
answer5 = Answer.create(content: "Learn Ruby ion reddit.", question_id: question2.id, user_id: user2.id)
answer6 = Answer.create(content: "Don't learn ruby!.", question_id: question3.id, user_id: user2.id)
answer7 = Answer.create(content: "Nope, it is not!", question_id: question3.id, user_id: user5.id)
