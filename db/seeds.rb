# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  name: "Tran Tuan",
  email: "ngoctuan.425@gmail.com",
  address: "ha noi",
  password: "123456",
  phone_number: "0987654321",
  role: 1)

(1..10).each do |n|
  User.create(
    name: "user#{n}",
    email: "user#{n}@gmail.com",
    address: "Hanoi #{n}",
    password: "123456",
    phone_number: "098765432#{n}",
    role: 0)
end

(1..4).each do |n|
  Subject.create(
    name: "Subject #{n}",
    duration: 10*n,
    question_number: 10*n)
end

(1..10).each do |n|
  Question.create(
    content: "Question #{n}",
    subject_id: 1,
    user_id: n,
    status: 1)
end

(1..10).each do |n|
  Question.create(
    content: "Do u have #{n} variables?",
    subject_id: 2,
    user_id: n,
    status: 1)
end

(1..10).each do |n|
  Question.create(
    content: "What is the value of params #{n}?",
    subject_id: 3,
    user_id: n,
    status: 1)
end

(1..10).each do |n|
  Question.create(
    content: "How about the performance of #{n} loops?",
    subject_id: 4,
    user_id: n,
    status: 1)
end

(1..3).each do |n|
  Exam.create(
    user_id: 1,
    subject_id: n,
    status: 0,
    spent_time: 0)
end

(1..3).each do |n|
  Exam.create(
    user_id: 1,
    subject_id: n,
    status: 1,
    spent_time: 0)
end

(1..3).each do |n|
  Exam.create(
    user_id: 1,
    subject_id: n,
    status: 2,
    spent_time: 0)
end

(1..3).each do |n|
  Exam.create(
    user_id: 1,
    subject_id: n,
    status: 3,
    spent_time: 0)
end

Question.all.each do |question|
  (1..4).each do |n|
    is_correct = n == 3 ? true : false
    Answer.create(
      content: "Answer #{n}",
      is_correct: is_correct,
      question_id: question.id)
  end
end
