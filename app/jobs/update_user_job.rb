class UpdateUserJob < ApplicationJob
  queue_as :default

  def perform(user)
    puts "calling enrichment API on #{user.email}"

    Clearbit.key = ENV['CLEARBIT_API']

    person = Clearbit::Enrichment::Person.find(email: user.email)
    sleep 3
    
    if person && !person.pending?
      puts JSON.pretty_generate(person)
    else
      puts "No information found from enrichment API."
    end
  end
end
