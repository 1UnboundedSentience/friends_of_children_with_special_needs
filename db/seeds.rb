# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

  emergency_contact_attrs = {email: 'emergency_contact@fcsn.org',
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
               name: 'Sandi Metz'}
  parent_attrs = emergency_contact_attrs.merge(email: 'parent@fcsn.org')
  student_attrs = {last_name: 'Hoover',
                  first_name: 'Student',
                  name: 'Student Hoover'}
  instructor_attrs = emergency_contact_attrs.merge(email: 'instructor@fcsn.org')
  coordinator_attrs = emergency_contact_attrs.merge(email: 'coordinator@fcsn.org')

  coordinator_person = Person.create_with(coordinator_attrs).find_or_create_by(email: coordinator_attrs[:email])
  instructor_person = Person.create_with(instructor_attrs).find_or_create_by(email: instructor_attrs[:email])
  emergency_contact_person = Person.create_with(emergency_contact_attrs).find_or_create_by(email: emergency_contact_attrs[:email])
  parent_person = Person.create_with(parent_attrs).find_or_create_by(email: parent_attrs[:email])
  student_person = Person.create_with(student_attrs).find_or_create_by(name: student_attrs[:name])

  instructor  = User.create_with(is_instructor: true, password: 'testing123', person: instructor_person)
                    .find_or_create_by(email: instructor_person[:email])
  coordinator = User.create_with(is_coordinator: true, password: 'testing123', person: coordinator_person)
                    .find_or_create_by(email: coordinator_person[:email])
  parent      = User.create_with(is_parent: true, password: 'testing123', person: parent_person)
                    .find_or_create_by(email: parent_person[:email])

  course  = Course.create_with(
                  description: 'Best art class eva!!!',
                  location: 'My House',
                  registration_start: '2015-05-10 12:53:24',
                  registration_end: '2025-03-10 12:53:24',
                  instructor: instructor,
                  coordinator: coordinator,
                  fees_in_cents: 1000,
                  comments: "Please bring your cameras with you. You will want a picture of the artwork",
                  lowest_age: 1,
                  highest_age: 16).find_or_create_by(name: 'Art class for seed')
  CourseDate.create_with(course: course).find_or_create_by(date: "2014-02-29")
  CourseTime.create_with( course: course).find_or_create_by(military_time: "15:30")


  student = Student.create_with(person: student_person,
                        allergies: "Nuts and mean people",
                        birthday: "2006-05-03",
                        gender: 'female',
                        talents: "Loves to sing and swim",
                        comment: "Gets agitated when there are mean people in the room",
                        behavior_intervention_plan: false,
                        one_on_one_aide: true).find_or_create_by(diagnosis: 'ADD for seed data')

  EmergencyContact.create_with(student: student).find_or_create_by(person: emergency_contact_person)
  Registration.create_with(course: course, student: student, photo_waiver: true).find_or_create_by(signature_svg: "my signature for seed")
