# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)
require 'bcrypt'


Faker::Config.locale = :es

users = []
5.times do |i|
    user = User.where(email: "example#{i + 1}@gmail.com").first_or_initialize
    user.update!(
        name: "Anh Dung #{i + 1}",
        email: "example#{i + 1}@gmail.com",
        password: "123456",
        password_confirmation: "123456",
        avatar: "/assets/avatar#{i + 1}.png"
    )
    users << user
end

tags = []
3.times do |i|
    tag = Tag.where(type_tag: i).first_or_initialize
    tag.update!(
        type_tag: i,
    )
    tags << tag
end

projects = []
10.times do |i|
    project = Project.where(name: "Project #{i + 1}").first_or_initialize
    description = Faker::Lorem.paragraph_by_chars
    20.times do
        description += "\n" + Faker::Lorem.paragraph_by_chars
    end
    project.update!(
        name: "Project #{i + 1}",
        description: description,
        tag_id: tags[i % tags.length].id,
        budget: 15000,
        start_time: Time.current,
        end_time: Time.current,
        # user_id: users[i % users.length].id
        user_id: users[0].id
    )
    projects << project
end

stages = []
15.times do |i|
    stage = Stage.where(name: "Stage #{i + 1}").first_or_initialize
    stage.update!(
        name: "Stage #{i + 1}",
        project_id: projects[0].id,
        # project_id: projects[i % projects.length].id,
    )
    stages << stage
end

25.times do |i|
    stage = stages[i % stages.length]
    task = Task.where(name: "Task #{i + 1}").first_or_initialize
    description = Faker::Lorem.paragraph_by_chars
    20.times do
        description += "\n" + Faker::Lorem.paragraph_by_chars
    end
    task.update!(
        name: "Task #{i + 1}",
        description: description,
        deadline: Time.current,
        tag_id: tags[i % tags.length].id,
        stage_id: stage.id,
        project_id: stage.project_id,
        user_id: users[i % users.length].id
    )
end