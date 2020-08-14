class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    puts "Calling Clearbit API for #{user.email}"

    require 'clearbit'
    Clearbit.key = ENV['CLEARBIT_API']

    person = Clearbit::Enrichment::Person.find(email: user.email)
    binding.pry

    if person && !person.pending?
      puts "Name: #{person.name.fullName}"
      puts "Location: #{person.location}"
      puts "Github Handle: #{person.github.handle}"
    else
      puts "Could not find data on #{user.email}"
    end
  end
end
