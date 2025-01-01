# db/seeds.rb
require 'faker'
require 'open-uri'

# Borrar datos existentes (opcional, para un entorno de desarrollo limpio)
User.destroy_all
Photograph.destroy_all
Comment.destroy_all

# Ruta base para las imágenes
images_path = "/home/xaba/M6desafio4/app/assets/images/"

# Crear usuario Karina
karina = User.new(
  email: "karina@example.com",
  password: "karina123",
  password_confirmation: "karina123"
)
karina.save!(validate: false)
karina.profile_picture.attach(
  io: File.open("#{images_path}karina.jpg"),
  filename: "karina.jpg",
  content_type: "image/jpg"
)
karina.save!

# Crear usuarios de prueba usando Faker y adjuntar fotos de perfil después de guardar el usuario
3.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
  user.save!(validate: false)
  user.profile_picture.attach(
    io: File.open("#{images_path}icono.png"),
    filename: "icono.png",
    content_type: "image/png"
  )
  user.save!
end

# Crear fotografías para Karina y adjuntar imágenes después de guardar la fotografía
photograph1 = karina.photographs.new(
  title: "Fotografía de prueba 1",
  description: "Una hermosa foto de bosque."
)
photograph1.save!(validate: false)
photograph1.image.attach(
  io: File.open("#{images_path}bosque.jpg"),
  filename: "bosque.jpg",
  content_type: "image/jpg"
)
photograph1.save!

photograph2 = karina.photographs.new(
  title: "Fotografía de prueba 2",
  description: "Una hermosa foto de sakura."
)
photograph2.save!(validate: false)
photograph2.image.attach(
  io: File.open("#{images_path}sakura.jpg"),
  filename: "sakura.jpg",
  content_type: "image/jpg"
)
photograph2.save!

# Crear comentarios en las fotografías
User.where.not(email: "karina@example.com").each do |user|
  Comment.create!(
    content: Faker::Lorem.sentence,
    user: user,
    photograph: photograph1
  )

  Comment.create!(
    content: Faker::Lorem.sentence,
    user: user,
    photograph: photograph2
  )
end

puts "Datos de prueba cargados correctamente."

