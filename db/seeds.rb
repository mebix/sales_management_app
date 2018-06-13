# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Project.create!(name:  "Example Project",
            project_number: "123")

Project.create!(name:  "Example Project2",
            project_number: "456")
            
Department.create!(name: "IT Promotion")
Department.create!(name: "Data Center")
Department.create!(name: "Research Promotion")

project = Project.first
project.expense_classes.create!(name:"System" , department_id: 1)
project.expense_classes.create!(name:"Data Management" , department_id: 2)
project.expense_classes.create!(name:"Site Open" , department_id: 3)

system = ExpenseClass.find_by(name: "System")
data_management = ExpenseClass.find_by(name: "Data Management")
site_open = ExpenseClass.find_by(name: "Site Open")

system.expense_masters.create!(name: "CapTool mini" , unit_text: "project")
data_management.expense_masters.create!(name: "Data Cleaning" , unit_text: "Query")
site_open.expense_masters.create!(name: "CRA" , unit_text: "FTE")


# 6.times do |n|
#   name  = "EDC"
#   class_name = "IT"
#   a = n + 1
#   billing_at = Time.current.since(a.month)

#   projects = Project.take(2)

#   projects.each do |project|
#     project.expenses.create!(name:  name,
#               class_name: class_name,
#               billing_at: billing_at,
#               unit: 1,
#               unit_price: 50000,
#               project: project,
#               deleted: false)
#   end
# end

# 6.times do |n|
#   name  = "CRA"
#   class_name = "ResearchPromotion"
#   a = n + 1
#   billing_at = Time.current.since(a.month)

#   projects = Project.take(2)

#   projects.each do |project|
#     project.expenses.create!(name:  name,
#               class_name: class_name,
#               billing_at: billing_at,
#               unit: 1,
#               unit_price: 150000,
#               project: project,
#               deleted: false)
#   end
# end
