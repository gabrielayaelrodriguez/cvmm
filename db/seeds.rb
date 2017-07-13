# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create! :name => 'admin', :admin => true, :email => 'admin@admin', :password => 'topsecret', :password_confirmation => 'topsecret'

GlobalResource.create! :totalRAM => 0, :totalUsableRAM => 0, :totalDiskSpace => 0, :totalUsableDiskSpace => 0, :totalCPUCores => 0, :totalUsableCPUCores => 0
