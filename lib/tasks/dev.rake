namespace :dev do

  desc "Rebuild system"
  task :build => %w(tmp:clear log:clear db:drop db:create db:migrate db:seed db:test:prepare)

  # add DISABLE_DATABASE_ENVIRONMENT_CHECK=1 for rails 5
  desc "generate dev seed"
  task :sample => :environment do
    Rake::Task["db:drop"].invoke
    Rake::Task["db:create"].invoke
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:seed"].invoke
    load File.join(pwd,'lib','sample.rb')
  end
end
