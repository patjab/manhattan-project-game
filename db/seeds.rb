# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.destroy_all
mathematician = Person.create(name: "Mathematician")
physicist = Person.create(name: "Physicist")
chemist = Person.create(name: "Chemist")
politician = Person.create(name: "Politician")

#INSERT QUESTION SEED DATA HERE
Question.destroy_all

math = [Question.create(question: "What is Pythagorean Theorem?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is the quadratic formula?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a derivative?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is an integral?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a partial differential?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a differential equation?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is L'Hopital's Rule?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "How do you find optimization of ...?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is the triangle inequality theorem?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a right triangle", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is an isoceles triangle?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a topology over a set?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer")]


physics = [Question.create(question: "What is Newton's First Law of Motion?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is Newton's Second Law of Motion?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is Newton's Third Law of Motion?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is the First Law of Thermodynamics?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is the Second Law of Thermodynamics?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is the Third Law of Thermodynamics?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is the Third Law of Thermodynamics?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is the speed of light?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is the gravitational constant", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is the acceleration constant on the Earth?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is Bernoulli's principle of Fluid Mechanics?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is Focault's Pendulum?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer")]


chemistry = [Question.create(question: "What is a the first element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a the second element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a the third element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a the fourth element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a the fifth element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a the sixth element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a the seventh element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a the eighth element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a the nineth element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What is a the tenth element of the periodic table?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer")]

history = [Question.create(question: "What happened in the 1000s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What happened in the 1100s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What happened in the 1200s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What happened in the 1300s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What happened in the 1400s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What happened in the 1500s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What happened in the 1600s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What happened in the 1700s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What happened in the 1800s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer"),
Question.create(question: "What happened in the 1900s?", option_a: "Wrong Answer 1", option_b: "Wrong Answer 2", option_c: "Wrong Answer 3", option_d: "Wrong Answer 4", answer: "Right Answer")]

math.each {|question| mathematician.questions << question}
physics.each {|question| physicist.questions << question}
chemistry.each {|question| chemist.questions << question}
history.each {|question| politician.questions << question}

# FOR REFERENCE ONLY
# mathematician = Person.find(1)
# physicist = Person.find(2)
# chemist = Person.find(3)
# politician = Person.find(4)
#
# patrick = Nation.find(1)
# steven = Nation.find(2)

Nation.create(nation_name: "Patrickland")
Nation.create(nation_name: "Stevenland")
