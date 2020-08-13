class FakeJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'Starting a fake job'
    sleep 3
    puts 'Job completed.'
  end
end
