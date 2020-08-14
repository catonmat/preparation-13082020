namespace :user do
  desc "Update All User With Clearbit Enrichment API."
  task update_all: :environment do
    users = User.all
    puts "Creating #{users.size} jobs."
    users.each { |user| UpdateUserJob.perform_later(user.id) }
  end
end
