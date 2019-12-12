# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
CatRental.destroy_all 

ApplicationRecord.connection.reset_pk_sequence!("cats")
ApplicationRecord.connection.reset_pk_sequence!("cat_rentals")
cat1 = Cat.create(birth_date: '2015/01/01', color: 'black', name: 'garfield', sex: 'M', description: 'lazy')
cat2 = Cat.create(birth_date: '2017/01/01', color: 'white', name: 'cat2', sex: 'F', description: 'fluffy')

rental1 = CatRental.create(cat_id: cat1.id, start_date: "2016/01/01", end_date: "2016/01/07", status: "APPROVED")
rental2 = CatRental.create(cat_id: cat1.id, start_date: "2016/01/02", end_date: "2016/01/07", status: "APPROVED")
rental3 = CatRental.create(cat_id: cat1.id, start_date: "2016/01/03", end_date: "2016/01/07", status: "APPROVED")