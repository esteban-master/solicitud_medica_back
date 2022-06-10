# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
Entity.create([
                { name: 'Arribalzaga Marcelo', tax_number: '43266659', address: 'Raul Labbe Nro. 13390 Depto. I 21' },
                { name: 'Esteban Castillo', tax_number: '61969286', address: 'Diego duble Urrutia 0501' },
                { name: 'Fernanda Ramos', tax_number: '99003812', address: 'Los Robles 1015 P. El Poligono' },
                { name: 'Felipe Rebolledo', tax_number: '51969286', address: 'Diego duble Urrutia 0501' },
                { name: 'Pedro Maldonado', tax_number: '71977286', address: 'Vital Apoquindo 1380 Casa 25' },
                { name: 'Sandra Balderrama', tax_number: '71977286', address: 'Vital Apoquindo 1380 Casa 25' },
                { name: 'Carla Ramos', tax_number: '71977286', address: 'Vital Apoquindo 1380 Casa 25' },
                { name: 'Barbara Catalina', tax_number: '71977286', address: 'Rio De Janeiro 629' },
                { name: 'Paola Lara', tax_number: '71977286', address: 'Juan Martinez 18' },
                { name: 'Emilia Castro', tax_number: '71977286', address: 'Vital Apoquindo 1380 Casa 25' },
              ])

Profession.create([
                    { name: 'Medico general' },
                    { name: 'Nutricionista' },
                    { name: 'Psicologo' },
                    { name: 'Traumatologo' },
                    { name: 'Kinesiologo' },
                  ])

Patient.create([
                 { entity: Entity.first },
                 { entity: Entity.second },
                 { entity: Entity.third },
                 { entity: Entity.fourth }
               ])

HealthProfessional.create([
                            { entity: Entity.all[4], profession: Profession.second },
                            { entity: Entity.all[5], profession: Profession.last },
                            { entity: Entity.all[6], profession: Profession.second },
                            { entity: Entity.all[7], profession: Profession.third },
                            { entity: Entity.all[8], profession: Profession.last },
                            { entity: Entity.all[9], profession: Profession.first },
                          ])