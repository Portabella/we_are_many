# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create({ name: 'Chicago' }, { name: 'Copenhagen' })
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([
  {
    first_name: 'Hulda',
    last_name:  'Albrecht',
    job:        'Senior Developer',
    city:       'Hamburg', 
    country:    'Germany',
    description: 'Lorem ipsum',
    email:       'anne_lenzen@gmx.de' 
  }
])

Interest.create(
  [{name: 'talk about'},
    {name: 'meet for a coffee'},
    {name: 'attend a conference together'},
    {name: 'be a mentor'},
    {name: 'sth. else'}]
)

Network.create(
  [{name: 'Geekettes'},
    {name: 'Digital Media Women'},
    {name: 'Rails Girls'},
    {name: 'Women who Code'},
    {name: 'Women 2.0'}]
)