# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

CasUser.create(cas_directory_id: 'jwestgard', name: "Josh", admin: true)
CasUser.create(cas_directory_id: 'peichman', name: "Peter", admin: true)
CasUser.create(cas_directory_id: 'mohideen', name: "Mohamed", admin: true)
CasUser.create(cas_directory_id: 'wallberg', name: "Ben", admin: true)
CasUser.create(cas_directory_id: 'katedohe', name: "Kate", admin: true)
