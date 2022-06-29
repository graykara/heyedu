namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'faker'

    Rake::Task['db:reset'].invoke

    1000.times do
      Post.create do |post|
        post.title = Faker::Lorem.sentence
        post.content = Faker::Lorem.paragraph
        post.category = %w[notice faq data one_on_one question press].sample
        post.user_id = [1, 2].sample
      end
    end
  end
end
