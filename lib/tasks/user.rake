namespace :user do
  desc "Update All User With Clearbit Enrichment API."
  task update_all: :environment do
    users = User.all
    puts "Creating #{users.size} jobs."
    users.each { |user| UpdateUserJob.perform_later(user.id) }
  end

  desc "Upate a single user with Clearbit Enrichment API"
  task :update, [:user_id] => :environment do |t, args|
    user = User.find(args[:user_id])
    puts "Enriching #{user.email}..."
    UpdateUserJob.perform_later(user.id)
  end
end
