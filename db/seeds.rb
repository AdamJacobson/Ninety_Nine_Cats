# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.destroy_all
CatRentalRequest.destroy_all
User.destroy_all

adam = User.create!(username: "Adam", password: "password")
josh = User.create!(username: "Josh", password: "password")
john = User.create!(username: "John", password: "password")


hobbes = Cat.create!(name: 'Hobbes', color: 'Tiger', birth_date: '2000/01/20', sex: 'M', description: 'Stuffed tiger', user_id: josh.id)
wendy = Cat.create!(name: 'Wendy', color: 'Tuxedo', birth_date: '2005/01/20', sex: 'F', description: 'Angry', user_id: adam.id)
willy = Cat.create!(name: 'Willy', color: 'Calico', birth_date: '1000/01/20', sex: 'M', description: 'Feline deity of the Aztecs', user_id: john.id)

CatRentalRequest.create!(cat_id: hobbes.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'PENDING', user_id: adam.id)
CatRentalRequest.create!(cat_id: hobbes.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'PENDING', user_id: john.id)
# CatRentalRequest.create!(cat_id: hobbes.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'PENDING')
CatRentalRequest.create!(cat_id: wendy.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'PENDING', user_id: josh.id)
CatRentalRequest.create!(cat_id: willy.id, start_date: '2017/05/30', end_date: '2017/06/10', status: 'PENDING', user_id: adam.id)
