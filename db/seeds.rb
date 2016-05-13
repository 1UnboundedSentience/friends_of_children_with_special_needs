# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  adult = Person.new(email: 'responsible_adult@fcsn.org',
                             cell_phone: '925-322-1111',
                             home_phone: '925-322-1112',
                             address_line_1: 'User Addr Line1',
                             address_line_2: 'User Addr Line2',
                             city: 'Greensboro',
                             state: 'NC',
                             postal_code: '95015',
                             work_phone: '925-322-1113',
                             last_name: 'Metz',
                             first_name: 'Sandi',
                             name: 'Sandi Metz')
  instructor  = User.new(is_instructor: true, email: 'instructor@fcsn.org', password: 'testing123', person: adult)
  coordinator = User.new(is_coordinator: true, email: 'coodinator@fcsn.org', password: 'testing123', person: adult)

#
# Class portion
#
  art_class      = Course.create(
                  name: 'Art class',
                  description: 'Best art class eva!!!',
                  location: 'My House',
                  registration_start: '2015-05-10 12:53:24',
                  registration_end: '2015-07-10 12:53:24',
                  instructor: art_instructor,
                  coordinator: art_coordinator,
                  fees_in_cents: 180,
                  comments: "Please bring your cameras with you. You will want a picture of the artwork",
                  lowest_age: 12,
                  highest_age: 22)
  CourseDate.create(date: "2015-05-10", course: course)
  CourseTime.create(military_time: "15:30", course: course)


#
# Students portion
#
  student_person = Person.new(
                    last_name: 'Hoover',
                    first_name: 'Student',
                    name: 'Student Hoover')

  student = Student.new(person: student_person,
                        allergies: "Nuts and mean people",
                        birthday: "2006-05-03",
                        gender: 'female',
                        diagnosis: 'ADD',
                        talents: "Loves to sing and swim",
                        comment: "Gets agitated when there are mean people in the room",
                        behavior_intervention_plan: false,
                        one_on_one_aide: true)


  EmergencyContact.create(person: adult, student: student)
  Registration.create(course: course, student: student, signature_svg: "my signature", photo_waiver: true)

  student = Student.new(person: Persons.new(
                        last_name: 'C',
                        first_name: 'Emily'
                        name: 'Emily C'
                        )
                        allergies: "Peanuts",
                        birthday: "2001-11-28",
                        gender: 'female',
                        diagnosis: 'PDD',
                        talents: "",
                        comment: "",
                        behavior_intervention_plan: false,
                        one_on_one_aide: false)

